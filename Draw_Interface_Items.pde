void drawInterface() {
  //Draw Array Items
  for (j = 0; j < iNumItems; j++) {
    if (frameCount == 1 || audioEffectTracker == true) {
      setItemCoordinates();
    }

    //Reduce Alpha of non selected Items
    if (iFadeOutValue[j] > 0) iFadeOutValue[j] *= 0.3;

    //Check Item Hover and Set Fill
    if (mouseX >= iX1[j] && mouseX <= iX2[j] && mouseY >= iY1[j] - iScrollOffset && mouseY <= iY2[j] - iScrollOffset) {
      fill(iCoActive);
      stroke(iCoActive);

      activeItem = j;
      iFadeOutValue[j] = iFadeOutValueBase;
    }
    else {
      fill(iCo);
      stroke(iCo);
      activeItem = -1;
    }

    //Draw Darker Background Behind Active Item
    if (iSpacer[j] == 0 && iY1[j] - iScrollOffset > height*0.1 + 10 && iY2[j] - iScrollOffset < height*0.86 - 5) {  //if() still here, because iDesc[j] has Problems otherwise
      noStroke();
      fill(lerpColor(iCoBackground, iCoBackgroundActive, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));

      pushMatrix();
      translate((iX1[j]) - iBarOffset*0.4 - 10, iY1[j] - iScrollOffset - iItemHeight*0.4);

      //Draw a Smaller Rectangle if a Button is active
      if (iButton[j] == 0) {
        rect(0, 0, iWidth - iMainXOffset + iBarOffset*0.4 + 10, iItemHeight + iItemDistance);
      } 
      else if (iButton[j] == 1) {
        fill(lerpColor(iCoCLickableAlpha, iCoCLickable, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));
        rect(0, 0, iWidth - iMainXOffset + iBarOffset*0.4 + 10, iItemHeight*0.5 + iItemDistance);
      }

      //Draw Description Background
      translate(iWidth - iMainXOffset + iBarOffset*0.4 + 10, 0);

      if (iButton[j] == 1 && iDesc[j].length() <= 40) {
        descBoxHeight = iItemHeight*0.5 + iItemDistance;
      } else if (iDesc[j].length() <= 40) {
        descBoxHeight = (iItemHeight + iItemDistance);
      } 
      else {
        descBoxHeight = (iItemHeight + iItemDistance) + (iDesc[j].length())*0.5 ;
      }

      fill(lerpColor(iCoBackgroundActiveAlpha, iCoBackgroundActive, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));
      rect(0, 0, 240, descBoxHeight);

      //Draw Description Text
      fill(lerpColor(iCoAlpha, iCo, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));
      textFont(aFontBig);
      textAlign(LEFT);
      text(iDesc[j], 20, iBarOffset*0.7, 200 - 10, descBoxHeight - 10);

      popMatrix();
    }

    //Set Interface Text Colors
    fill(lerpColor(iCo, iCoActive, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));
    stroke(lerpColor(iCo, iCoActive, norm(iFadeOutValue[j], 0, iFadeOutValueBase)));


    if (iSpacer[j] == 0) {
      //Display Name
      textFont(aFontBig);
      textAlign(LEFT);
      if (j == cShowCountdownJ && cShowCountdown == 1) {
        text("Stop Countdown", iX1[j], iY1[j] - iScrollOffset + (iTypeSizeBig));
      } 
      else if (j == cShowCountdownJ && cShowCountdown == 0) {
        text("Start Countdown", iX1[j], iY1[j] - iScrollOffset + (iTypeSizeBig));
      }
      else {
        text(iName[j], iX1[j], iY1[j] - iScrollOffset + (iTypeSizeBig));
      }        

      //Display Current Setting
      if (iHideCurrent[j] == 0) {
        textFont(aFontSma);
        textAlign(RIGHT);

        if (j == cEffectJ) {
          text(cNames[cEffect], (iX2[j]) - 20, iY1[j] - iScrollOffset + (iTypeSizeSma));
        }
        else if (j == audioEffectJ) {
          text(iEName[audioEffect], (iX2[j]) - 20, iY1[j] - iScrollOffset + (iTypeSizeSma));
        }        
        else if (iCurrent[j] + iDisplayCurrentOffset[j] == 0) {
          text("off", (iX2[j]) - 20, iY1[j] - iScrollOffset + (iTypeSizeSma));
          ;
        } 
        else if (iButton[j] == 1 && (iCurrent[j] + iDisplayCurrentOffset[j]) == 1) {
          text("on", (iX2[j]) - 20, iY1[j] - iScrollOffset + (iTypeSizeSma));
          ;
        } 
        else {
          text(iCurrent[j] + iDisplayCurrentOffset[j], (iX2[j]) - 20, iY1[j] - iScrollOffset + (iTypeSizeSma));
        }
      }
      //Draw Bar
      //Calculate Bar Base Increments
      iBaseSteps = max(iMax[j], iMin[j]) - min(iMin[j], iMax[j]);


      //Correct Base Steps for Items Starting with 0
      if (iBaseSteps == 0) {
        iBaseSteps++;
      }

      //Calculate Bar Step Length
      int iBaseBarIncrements = floor(iBarWidth / iBaseSteps);

      //Prohibit Completely filled Base Bars
      if (iBaseBarIncrements <= 2) {
        iBaseBarIncrements = 2;
      }

      //Draw Bar Base     
      if (iButton[j] == 0) {
        pushMatrix();
        translate(iX1[j] + iBarOffset, iY1[j] - iScrollOffset + iBarHeight + 13);
        for (int bx = 0; bx < iBarWidth; bx += iBaseBarIncrements) {
          line(bx, 0, bx, iBarHeight);
        }

        //Draw Bar Current
        barCurrent = map(iCurrent[j], iMin[j], iMax[j], 1, iBarWidth-1);
        if (activeItem != j) {
          if (iMax[j] * iBaseBarIncrements <= iBarWidth ) {
            rect(0, 0, iCurrent[j] * iBaseBarIncrements, iBarHeight);
          } 
          else {
            rect(0, 0, barCurrent, iBarHeight);
          }
        }
        else if ((mouseX - iMainXOffset - iBarOffset+1) >= 0 && (mouseX - iMainXOffset - iBarOffset-1) <= iBarWidth) {
          //Draw Smaller Current Bar
          if (iMax[j] * iBaseBarIncrements <= iBarWidth ) {
            rect(0, -3, iCurrent[j] * iBaseBarIncrements, -1);
          }  
          else {
            rect(0, -3, barCurrent, -1);
          }

          //User Bar Preview
          fill(iCoCLickable);
          stroke(iCoCLickable);

          //Calculate new iCurrent based on Mouse Position
          barUser = round(map(mouseX - iMainXOffset - iBarOffset, 0, iBarWidth, iMin[j], iMax[j]));

          //Draw User Bar Preview
          if (iMax[j] >= 80) {
            rect(0, 0, mouseX - iMainXOffset - iBarOffset, iBarHeight);
          }
          else if (iMax[j] * iBaseBarIncrements <= iBarWidth ) {
            rect(0, 0, barUser*iBaseBarIncrements, iBarHeight);
          }   
          else {
            barUserShort = round(map(mouseX - iMainXOffset - iBarOffset, iMin[j], iMax[j], 0, iBarWidth));
            rect(0, 0, barUserShort, iBarHeight);
          }
        } 
        else {
          if (iCurrent[j] * iBaseBarIncrements <= iBarWidth ) {
            rect(0, 0, iCurrent[j] * iBaseBarIncrements, iBarHeight);
          } 
          else {
            rect(0, 0, barCurrent, iBarHeight);
          }
        }


        //Draw Add, Remove Buttons
        if (activeItem == j) {        
          //Draw Remove
          stroke(iCoCLickable);
          line(-16, 5, -11, 5);

          //Draw Add
          line(16+iBarWidth, 5, 10+iBarWidth, 5);
          line(13+iBarWidth, 2, 13+iBarWidth, iBarHeight - 2);
        }


        popMatrix();
      }
    }
    //Fade Out Top Items
    fill(iCoBackground);
    noStroke();
    rect(0, 0, iWidth, floor(height*0.1 - 60));
    for (FadeOutTracker = 0; FadeOutTracker < 60; FadeOutTracker++) {
      normFadeOutTracker = norm(FadeOutTracker, 0, 60);
      stroke(lerpColor(iCoBackground, iCoBackgroundAlpha, normFadeOutTracker));
      line(0, floor(height*0.1) - 60 + FadeOutTracker, iWidth - 1, floor(height*0.1) - 60 + FadeOutTracker);
    }

    //Fade Out Bottom Items
    fill(iCoBackground);
    //noStroke();
    rect(0, height*0.86 + 60, iWidth, height);
    for (FadeOutTracker = 60; FadeOutTracker > 0; FadeOutTracker--) {
      normFadeOutTracker = norm(FadeOutTracker, 0, 60);
      stroke(lerpColor(iCoBackground, iCoBackgroundAlpha, normFadeOutTracker));
      line(0, height*0.86 + 60 - FadeOutTracker, iWidth - 1, height*0.86 + 60 - FadeOutTracker);
    }

    //calculate scrollposition indicator
    lineScrollHeight = (sq(dist(0, height*0.14, 0, height*0.86)))/(dist(0, iY1[0], 0, iY2[iNumItems - 1]));
    lineScrollOffset = ((dist(0, height*0.14, 0, iY1[0] - iScrollOffset))*lineScrollHeight)/(dist(0, height*0.14, 0, height*0.86));

    //draw indicator background
    strokeCap(ROUND);
    strokeWeight(5);
    smooth();

    scrollBarCol = (lerpColor(iCoAlpha, iCo, norm(scrollBarFadeTracker, 0, 100)));
    if (norm(scrollBarFadeTracker, 0, 100) < 0.008) scrollBarCol = iCoAlpha;
    stroke(scrollBarCol);
    line(7, height*0.115, 7, height*0.83);


    //draw position indicator
    scrollBarCol = (lerpColor(iCoAlpha, iCo, norm(scrollBarFadeTracker, 0, 5)));
    stroke(scrollBarCol);

    if (scrollBarFadeTracker > 0.07) {
      scrollBarFadeTracker *= 0.98;
    } 
    else {
      scrollBarFadeTracker = 0.07;
    }

    line(7, lineScrollOffset + height*0.1, 7, lineScrollHeight + lineScrollOffset + height*0.1);    
    noStroke();

    strokeWeight(1);

    //TOO SLOW
    //    //Set Top Pixel Colors onto Canvas
    //    for (int iBPut = 0; iBPut < iWidth * height*0.2; iBPut++) {
    //
    //      if (iBPut >= iWidth) {
    //        set(iBPut%iWidth, iBPut/iWidth, iFadeOutColors[iBPut]);
    //      } 
    //      else {
    //        set(iBPut, 0, iFadeOutColors[iBPut]);
    //      }
    //    }

    //Item List Loop End
  }
}

