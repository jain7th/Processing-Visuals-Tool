void applyInterfaceItems() {
  int aIndex = 0;


  if (audioEffect == 0) {
    //Arcs
    iName[aIndex] = "Arcs";
    iIndex[aIndex] = "aNumArcs";
    iMin[aIndex] = 1;
    iMax[aIndex] = 40;
    iCurrent[aIndex] = aNumArcs;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Number of arcs per arm";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    aNumArcsJ = aIndex;
    aIndex++;


    //Arms
    iName[aIndex] = "Arms";
    iIndex[aIndex] = "aNumArms";
    iMin[aIndex] = 1;
    iMax[aIndex] = 18;
    iCurrent[aIndex] = aNumArms;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Number of arc arms";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    aNumArmsJ = aIndex;
    aIndex++;
  }

  if (audioEffect == 1) {   
    //Bars
    iName[aIndex] = "Bars";
    iIndex[aIndex] = "bNumBars";
    iMin[aIndex] = 2;
    iMax[aIndex] = 40;
    iCurrent[aIndex] = bNumBars;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Number of bars";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    bNumBarsJ = aIndex;
    aIndex++;


    //Bar Offset
    iName[aIndex] = "Bar Offset";
    iIndex[aIndex] = "bBarPosOffset";
    iMin[aIndex] = 0;
    iMax[aIndex] = 40;
    iCurrent[aIndex] = bBarPosOffset;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Offests bar base according to the music";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    bBarPosOffsetJ = aIndex;
    aIndex++;
  }

  if (audioEffect == 2) {
    //Points
    iName[aIndex] = "Points";
    iIndex[aIndex] = "lNumPoints";
    iMin[aIndex] = 3;
    iMax[aIndex] = 400;
    iCurrent[aIndex] = lNumPoints;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Number of points, between which, the lines get drawn";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    lNumPointsJ = aIndex;
    aIndex++;
  }

  //Spin Speed
  iName[aIndex] = "Spin Speed";
  iIndex[aIndex] = "spinSpeed";
  iMin[aIndex] = 0;
  iMax[aIndex] = 20;
  iCurrent[aIndex] = spinSpeed;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Speed of rotation while music is playing";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = -10;
  iFadeOutValue[aIndex] = 0;

  spinSpeedJ = aIndex;
  aIndex++;


  if (audioEffect == 0) {
    //Arc Rotation Offset
    iName[aIndex] = "Arc Rotation Offset";
    iIndex[aIndex] = "arcRotationOffset";
    iMin[aIndex] = 0;
    iMax[aIndex] = 4;
    iCurrent[aIndex] = arcRotationOffset;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Offset middle of each arc";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    arcRotationOffsetJ = aIndex;
    aIndex++;
  }

  if (audioEffect == 1) {
    //Bar Rotating Update
    iName[aIndex] = "Rotating Update";
    iIndex[aIndex] = "bRotUpdate";
    iMin[aIndex] = 0;
    iMax[aIndex] = 1;
    iCurrent[aIndex] = bRotUpdate;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 1;
    iDesc[aIndex] = "Updates Bars one after another";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    bRotUpdateJ = aIndex;
    aIndex++;
  }

  if (audioEffect == 2) {
    //History
    iName[aIndex] = "History";
    iIndex[aIndex] = "lNumHistory";
    iMin[aIndex] = 0;
    iMax[aIndex] = 8;
    iCurrent[aIndex] = lNumHistory;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Number of previous lines";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    lNumHistoryJ = aIndex;
    aIndex++;


    //History Offset 
    iName[aIndex] = "History Offset";
    iIndex[aIndex] = "lHistoryOffset";
    iMin[aIndex] = 0;
    iMax[aIndex] = 40;
    iCurrent[aIndex] = lHistoryOffset;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Offset of previous lines per frame";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = -20;
    iFadeOutValue[aIndex] = 0;

    lHistoryOffsetJ = aIndex;
    aIndex++;


    //History Base Distance 
    iName[aIndex] = "History Base Distance";
    iIndex[aIndex] = "lHistoryDistanceBase";
    iMin[aIndex] = 0;
    iMax[aIndex] = 60;
    iCurrent[aIndex] = (int)lHistoryDistanceBase;
    iX1[aIndex] = 0;
    iY1[aIndex] = 0;
    iX2[aIndex] = 0;
    iY2[aIndex] = 0;
    iButton[aIndex] = 0;
    iDesc[aIndex] = "Base distance between previous lines per frame";
    iSpacer[aIndex] = 0;
    iHideCurrent[aIndex] = 0;
    iDisplayCurrentOffset[aIndex] = 0;
    iFadeOutValue[aIndex] = 0;

    lHistoryDistanceBaseJ = aIndex;
    aIndex++;
  }


  //Update Frame Skip
  iName[aIndex] = "Update Frame Skip";
  iIndex[aIndex] = "numSkipFrames";
  iMin[aIndex] = 0;
  iMax[aIndex] = 10;
  iCurrent[aIndex] = numSkipFrames;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Number of frames to skip between arc updates. Produces smoother animation smoother, but can produce artifacts";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  numSkipFramesJ = aIndex;
  aIndex++;


  //Randomize Values
  iName[aIndex] = "Randomize Values Above";
  iIndex[aIndex] = "randValues";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = randValues;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Randomizes the values above";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 1;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  randValuesJ = aIndex;
  aIndex++;


  //Randomize Values Interval
  iName[aIndex] = "Randomize Values Interval";
  iIndex[aIndex] = "randomInterval";
  iMin[aIndex] = 0;
  iMax[aIndex] = 40;
  iCurrent[aIndex] = randomInterval;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Randomizes the visuals at a set interval";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  randomIntervalJ = aIndex;
  aIndex++;


  //Muliplier
  iName[aIndex] = "Length Multiplier";
  iIndex[aIndex] = "multiplier";
  iMin[aIndex] = 0;
  iMax[aIndex] = 5;
  iCurrent[aIndex] = mulitplier;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Multiply audio levels";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  mulitplierJ = aIndex;
  aIndex++;


  //Spacer
  iSpacer[aIndex] = 1;
  aIndex++;

  //Update Interpolation
  iName[aIndex] = "Update Interpolation";
  iIndex[aIndex] = "interpolate";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = interpolate;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Get the average between two updates. Makes for an smoother animation, but can produce artifacts";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  interpolateJ = aIndex;
  aIndex++;


  //White Lines
  iName[aIndex] = "White Lines";
  iIndex[aIndex] = "whiteLines";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = whiteLines;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Effects get rendered in white";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  whiteLinesJ = aIndex;
  aIndex++;


  //Fade Out
  iName[aIndex] = "Fade Out";
  iIndex[aIndex] = "fadeOut";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = fadeOut;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Previous frames fade out slowly";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  fadeOutJ = aIndex;
  aIndex++;


  //Audio Effects
  iName[aIndex] = "Audio Effect";
  iIndex[aIndex] = "audioEffect";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = audioEffect;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Select audio effects";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  audioEffectJ = aIndex;
  aIndex++;

  //Randomize Values Interval
  iName[aIndex] = "Random Effect Interval";
  iIndex[aIndex] = "randomEffectInterval";
  iMin[aIndex] = 0;
  iMax[aIndex] = 80;
  iCurrent[aIndex] = randomEffectInterval;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Randomizes the effect at a set interval";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  audioEffectRandJ = aIndex;
  aIndex++;

  //Spacer
  iSpacer[aIndex] = 1;
  aIndex++;

  //Set Minutes for Countdown
  iName[aIndex] = "Set Minutes for Countdown ";
  iIndex[aIndex] = "cMinutes";
  iMin[aIndex] = 1;
  iMax[aIndex] = 120;
  iCurrent[aIndex] = cMinutes;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 0;
  iDesc[aIndex] = "Set how many minutes will be count down";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  cMinutesJ = aIndex;
  aIndex++;

  //Start Countdown
  iName[aIndex] = "Start Countdown";
  iIndex[aIndex] = "cShowCountdown";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = cShowCountdown;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Select audio effects";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 1;
  iDisplayCurrentOffset[aIndex] = 0;
  iFadeOutValue[aIndex] = 0;

  cShowCountdownJ = aIndex;
  aIndex++;

  //Switch Countdown Effect
  iName[aIndex] = "Countdown Effect";
  iIndex[aIndex] = "cEffect";
  iMin[aIndex] = 0;
  iMax[aIndex] = 1;
  iCurrent[aIndex] = cEffect;
  iX1[aIndex] = 0;
  iY1[aIndex] = 0;
  iX2[aIndex] = 0;
  iY2[aIndex] = 0;
  iButton[aIndex] = 1;
  iDesc[aIndex] = "Select countdown effect";
  iSpacer[aIndex] = 0;
  iHideCurrent[aIndex] = 0;
  iDisplayCurrentOffset[aIndex] = 1;
  iFadeOutValue[aIndex] = 0;

  cEffectJ = aIndex;
  aIndex++;

  iNumItems = aIndex;
}

