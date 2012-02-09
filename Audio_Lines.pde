void setupAudioLines() {
  lMaxRadius = scaler*0.32;
  lMinRadius = scaler*0.15;

  in = minim.getLineIn(Minim.STEREO, lNumPoints);

  //Set Up Rotation Between Points
  lPointAngle = TWO_PI/(float)lNumPoints;

  lStrokeWeight = round(scaler * 0.004);
}

void drawAudioLines() {
  //Get updated Values from Interface
  lNumPoints = iCurrent[lNumPointsJ];
  lNumHistory = iCurrent[lNumHistoryJ];
  lHistoryOffset = iCurrent[lHistoryOffsetJ];
  lHistoryDistanceBase = iCurrent[lHistoryDistanceBaseJ];

  if (normLeftInput > 0.00001) {
    allRotateDeg += spinSpeed + iDisplayCurrentOffset[spinSpeedJ];
  }
  else {
    allRotateDeg += 0.12;
  }

  allRotateReg = radians(allRotateDeg);
  rotate(allRotateReg);

  //Initialize Minim 
  if (lNumPointsTracker != lNumPoints) {
    in = minim.getLineIn(Minim.STEREO, lNumPoints);

    //Set Up Rotation Between Points
    lPointAngle = TWO_PI/(float)lNumPoints;

    lNumPointsTracker = lNumPoints;
  }

  for (lI3 = 0; lI3 <= lNumHistory; lI3++) {
    //Draw Lines
    for (lI = 0; lI < lNumPoints; lI++) {
      if (lI == 0) {
        //Get Audio Data And Write It Into An Array
        for (lI2 = 0; lI2 < lNumPoints; lI2++) {
          //Move Historic Vales
          if (lI3 < lNumHistoryMax && lI2 < lNumPointsMax) {  //Array Index Crash Fix, if Random Intervals are small
            lValues[(lNumPointsMax * (lI3 + 1))+lI2] = lValues[(lNumPointsMax * lI3)+lI2];
          }

          //Write Current Values
          getAudioInputs(lI2);  
          normInputs = (normRightInput + normLeftInput) * 0.5 * (mulitplier + 1);
          lValues[lI2] = normInputs;
        }

        if (lI3 < lNumHistoryMax && lI2 < lNumPointsMax) {  //Array Index Crash Fix, if Random Intervals are small
          lP1X = map(lValues[(lNumPointsMax * lI3) + lNumPoints-1], 0, 1, (lHistoryDistance * lI3) + lMinRadius, (lHistoryDistance * lI3) + lMaxRadius) * sin(lPointAngle * ((lNumPointsMax * lI3) + lNumPoints-1));
          lP1Y = map(lValues[(lNumPointsMax * lI3) + lNumPoints-1], 0, 1, (lHistoryDistance * lI3) + lMinRadius, (lHistoryDistance * lI3) + lMaxRadius) * cos(lPointAngle * ((lNumPointsMax * lI3) + lNumPoints-1));
        }
      }

      //Set P2 Data
      if (lI3 < lNumHistoryMax && lI2 < lNumPointsMax) {  //Array Index Crash Fix, if Random Intervals are small
        lP2X = map(lValues[(lNumPointsMax * lI3) + lI], 0, 1, (lHistoryDistance * lI3) + lMinRadius, (lHistoryDistance * lI3) + lMaxRadius) * sin(lPointAngle * ((lNumPointsMax * lI3) + lI));
        lP2Y = map(lValues[(lNumPointsMax * lI3) + lI], 0, 1, (lHistoryDistance * lI3) + lMinRadius, (lHistoryDistance * lI3) + lMaxRadius) * cos(lPointAngle * ((lNumPointsMax * lI3) + lI));
      }

      //Draw line
      noFill();
      strokeWeight(lStrokeWeight);

      if (whiteLines == 0) {
        if (lI3 < lNumHistoryMax && lI2 < lNumPointsMax) {  //Array Index Crash Fix, if Random Intervals are small
          lColorHue = map(lValues[round(lNumPointsMax * lI3)], 0, 0.8, 58, 2);
        }
        stroke(lColorHue, 80, 100);
      } 
      else {
        stroke(90);
      }
      line(lP1X, lP1Y, lP2X, lP2Y);

      //Set P1 Data for next run
      lP1X = lP2X;
      lP1Y = lP2Y;
    }
  }

  lHistoryDistance += (lHistoryOffset + iDisplayCurrentOffset[lHistoryOffsetJ])*0.2;

  if (lHistoryDistance == 0) {
    lHistoryDistance = lHistoryDistanceBase;
  }
  else if (lHistoryDistance > scaler*0.13 || lHistoryDistance < -(scaler*0.05)) {
    lHistoryDistance = (lHistoryOffset >= 0) ? lHistoryDistanceBase:-lHistoryDistanceBase;
  }
}

