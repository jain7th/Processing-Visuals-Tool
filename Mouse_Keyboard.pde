//Button Actions
void mouseClicked() {
  mouseClickedTracker = true;

  if (mouseY > height*0.14 && mouseY < height*0.88) {
    //Audio Effect Change Tracker
    if (mouseX >= iX1[audioEffectJ] && mouseX <= iX2[audioEffectJ] && mouseY >= iY1[audioEffectJ] - iScrollOffset && mouseY <= iY2[audioEffectJ] - iScrollOffset) {
      audioEffectTracker = true;
      iCurrent[audioEffectJ] += 1;
      if (iCurrent[audioEffectJ] == iEIndexNum) iCurrent[audioEffectJ] = 0;
      audioEffect = iCurrent[audioEffectJ];
    }

    //Randomizer
    if (mouseX >= iX1[randJ] && mouseX <= iX2[randJ] && mouseY >= iY1[randJ] - iScrollOffset && mouseY <= iY2[randJ] - iScrollOffset) { 
      randomizer();
    }

    //Interpolate   
    if (mouseX >= iX1[interpolateJ] && mouseX <= iX2[interpolateJ] && mouseY >= iY1[interpolateJ] - iScrollOffset && mouseY <= iY2[interpolateJ] - iScrollOffset) {
      iCurrent[interpolateJ] = (iCurrent[interpolateJ] == 0) ? 1:0;
    }


    //White LInes
    if (mouseX >= iX1[whiteLinesJ] && mouseX <= iX2[whiteLinesJ] && mouseY >= iY1[whiteLinesJ] - iScrollOffset && mouseY <= iY2[whiteLinesJ] - iScrollOffset) {
      iCurrent[whiteLinesJ] = (iCurrent[whiteLinesJ] == 0) ? 1:0;
    }

    //Fade Out
    if (mouseX >= iX1[fadeOutJ] && mouseX <= iX2[fadeOutJ] && mouseY >= iY1[fadeOutJ] - iScrollOffset && mouseY <= iY2[fadeOutJ] - iScrollOffset) {
      fadeOut = 1 - fadeOut;
    }

    //Start Countdown
    if (mouseX >= iX1[cShowCountdownJ] && mouseX <= iX2[cShowCountdownJ] && mouseY >= iY1[cShowCountdownJ] - iScrollOffset && mouseY <= iY2[cShowCountdownJ] - iScrollOffset) {      
      cShowCountdown = (cShowCountdown == 1) ? 0:1;
      if (cShowCountdown == 1) {
        count.startCoundown(cMinutes);
        countFlat.startCounter(cMinutes);
      }
    }

    //Switch Countdown Effect
    if (mouseX >= iX1[cEffectJ] && mouseX <= iX2[cEffectJ] && mouseY >= iY1[cEffectJ] - iScrollOffset && mouseY <= iY2[cEffectJ] - iScrollOffset) {
      cEffect = (cEffect == 1) ? 0:1;
    }

    //Change Bar Values Buttons
    for (int a = 0; a < iNumItems; a++) {
      //Set Current to Min with Double Click
      if (mouseX >= iX1[a] && mouseY >= iY1[a] - iScrollOffset && mouseX <= (iX1[a] + 20) && mouseY <= (iY1[a] - iScrollOffset + iItemHeight) && iButton[a] == 0 && iCurrent[a] > iMin[a] && mouseEvent.getClickCount()==3) {
        iCurrent[a] = iMin[a];
      }
      //Remove one
      else if (mouseX >= iX1[a] && mouseY >= iY1[a] - iScrollOffset && mouseX <= (iX1[a] + 20) && mouseY <= (iY1[a] - iScrollOffset + iItemHeight) && iButton[a] == 0 && iCurrent[a] > iMin[a]) {
        iCurrent[a]--;
      }
      //Set Current to Max with Double Click
      else if (mouseX <= iX2[a] && mouseX >= (iX2[a] - 10) && mouseY <= iY2[a] - iScrollOffset && mouseY >= iY1[a] - iScrollOffset && iButton[a] == 0 && iCurrent[a] < iMax[a] && mouseEvent.getClickCount()==3) {
        iCurrent[a] = iMax[a];
      }
      //Add one
      else if (mouseX <= iX2[a] && mouseX >= (iX2[a] - 10) && mouseY <= iY2[a] - iScrollOffset && mouseY >= iY1[a] - iScrollOffset && iButton[a] == 0 && iCurrent[a] < iMax[a]) {
        iCurrent[a]++;
      }
      //Apply Bar Status
      if (mouseX >= iX1[a] + 22 && mouseX <= iX2[a] - 12 && mouseY >= iY1[a] - iScrollOffset && mouseY <= iY2[a] - iScrollOffset) {
        iCurrent[a] = round(map(mouseX - iMainXOffset - iBarOffset, 0, iBarWidth, iMin[a], iMax[a]));
      }
    }
  }
}

void mouseDragged() {
  mouseClickedTracker = true;
  iInterfaceItemHover = false; 

  //Apply Dragged Bar Status
  for (int a = 0; a < iNumItems; a++) {
    if (mouseX >= iX1[a] + 22 && mouseX <= iX2[a] - 12 && mouseY >= iY1[a] - iScrollOffset && mouseY <= iY2[a] - iScrollOffset && mouseY > height*0.14 && mouseY < height*0.86) {
      iCurrent[a] = round(map(mouseX - iMainXOffset - iBarOffset, 0, iBarWidth, iMin[a], iMax[a]));
      iInterfaceItemHover = true;
    }
  }


  //Scroll Interface by Dragging Up or Down
  if (mouseX < iWidth + 10 && !iInterfaceItemHover && dist(0, mouseY, 0, pmouseY) > iBarHeight*0.2) {
    if (mouseY < pmouseY && iY2[iNumItems - 1] - iScrollOffset + iMainYOffset > height*0.95) {
      iSrollPosTracker += round(dist(0, mouseY, 0, pmouseY));
    } 
    else if (mouseY > pmouseY && iY1[0] - iScrollOffset  + iMainYOffset < height*0.2 + 20) {
      iSrollPosTracker -= round(dist(0, mouseY, 0, pmouseY));
    }

    iScrollOffset = iSrollPosTracker;

    scrollBarFadeTracker = 5;
  }
}

void keyTyped() {
  //Pause Frame
  if (int(key) == 32) {
    if (paused) {
      loop();
      paused = false;
    } 
    else {
      float pauseBSizeBase = (scaler*0.035);
      float pauseBHeight = pauseBSizeBase*2.76;
      float pauseBDis = pauseBSizeBase*0.4;

      noStroke();
      fill(80, 55);

      rect(width-15, height-10, -pauseBSizeBase, -pauseBHeight);
      rect(width-15-pauseBSizeBase-pauseBDis, height-10, -pauseBSizeBase, -pauseBHeight);

      noFill();
      noLoop();
      paused = true;
    }
  }

  //Demo Player
  if (int(key) == 112) {
    if (song.isPlaying()) {
      song.pause();
      song.rewind();
      demoPlayerTracker = false;
    } 
    else {
      song.play();
      demoPlayerTracker = true;
    }
  }
}

//Scroll Interface Up or Down With Mousewheel
void mouseWheel(float mouseWheelDelta) {
  mouseWheelDeltaNorm = floor((mouseWheelDelta*0.8 + mouseWheelDeltaOld)*0.5);

  scrollBarFadeTracker = 5;

  iScrollOffset = iSrollPosTracker;

  //Scroll Interface Up
  if (iY2[iNumItems - 1] - iScrollOffset + iMainYOffset > height*0.95) {
    iSrollPosTracker += constrain(mouseWheelDeltaNorm, 0, 10);
  }
  //Scroll Interface Down
  if (iY1[0] - iScrollOffset  + iMainYOffset < height*0.2 + 20) {
    iSrollPosTracker += constrain(mouseWheelDeltaNorm, -10, 0);
  }

  mouseWheelDeltaOld = floor(mouseWheelDelta*0.8);
}

