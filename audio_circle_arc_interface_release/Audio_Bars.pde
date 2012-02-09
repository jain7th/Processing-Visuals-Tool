void setupAudioBars() {
  bInnerRadius = scaler*0.1;
  bOuterRadius = scaler*0.48;
  bBarMaxLength = bOuterRadius - bInnerRadius;

  in = minim.getLineIn(Minim.STEREO, bNumBars);
}

void drawAudioBars() {

  bNumBars = iCurrent[bNumBarsJ];
  bBarPosOffset = iCurrent[bBarPosOffsetJ];
  bRotUpdate = iCurrent[bRotUpdateJ];

  if (normLeftInput > 0.00001) {
    allRotateDeg += spinSpeed + iDisplayCurrentOffset[spinSpeedJ];
  }
  else {
    allRotateDeg += 0.12;
  }

  allRotateReg = radians(allRotateDeg);
  rotate(allRotateReg);

  //Set Up Bar Rotaion And Initialize Minim 
  if (bNumBarsTracker != bNumBars || audioEffectTracker == true) {
    bBarRotation = radians(360./bNumBars);

    in = minim.getLineIn(Minim.STEREO, bNumBars);

    //Calculate Stroke Width
    bStrokeWeight = ((2*bInnerRadius*PI)/bNumBars)*0.79;

    if (bStrokeWeight < 1) {
      bStrokeWeight = 1;
    } 
    else if (bNumBars == 2) {
      bStrokeWeight *= 0.6;
    }
    else if (bStrokeWeight > (360./bNumBars)) {
      bStrokeWeight = (360./bNumBars)*1.4;
    }
  }

  bNumBarsTracker = bNumBars;

  //Draw Bars
  for (int bI = 0; bI < bNumBars; bI++) {
    getAudioInputs(bI);    

    normInputs = (normRightInput + normLeftInput) * 0.5 * (mulitplier + 1 + iDisplayCurrentOffset[7]);

    //Put input Values into Array
    if (bRotUpdate == 1 && bI == bRotUpdateTracker) {
      bValues[bI] = normInputs;
    } 
    else if (bRotUpdate == 0) {
      bValues[bI] = normInputs;
    }

    //Map Audio Inputs for Bars Length
    bBarLength = map(bValues[bI], 0, 1, bInnerRadius, bBarMaxLength);

    rotate(bBarRotation);

    if (whiteLines == 0) {
      colorHue = map(bValues[bI], 0, 0.8, 58, 2);
      stroke(colorHue, 80, 100);
    } 
    else {
      stroke(90);
    }

    noFill();    
    strokeWeight(bStrokeWeight);

    //Draw Bar
    line(bInnerRadius + bBarPosOffset*5*bValues[bI], 0, bBarLength + bBarPosOffset*5*bValues[bI], 0);
  }
  if (bRotUpdateTracker < bNumBars) {
    bRotUpdateTracker++;
  } 
  else {
    bRotUpdateTracker = 0;
  }
}

