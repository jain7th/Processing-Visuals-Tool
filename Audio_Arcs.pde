void drawAudioArcs() {
  //ARCS
  //update Values
  aNumArcs = iCurrent[aNumArcsJ];
  aNumArms = iCurrent[aNumArmsJ];
  arcRotationOffset = iCurrent[arcRotationOffsetJ] + iDisplayCurrentOffset[arcRotationOffsetJ];


  //Check for Arc Num Changes to only update the Audio Input when actually needed
  if (arcTracker != iCurrent[aNumArcsJ] || armTracker != iCurrent[aNumArmsJ] || audioEffectTracker == true) {
    //Auto Scaling
    circleArcDistance = scaler/6;

    //Adjust Inner Circle Radius for Less Arms
    if (aNumArcs < 5) {
      circleArcDistance = (scaler/6) * ((iMax[0] - aNumArcs)*0.04);
    } 
    else if (aNumArcs > 6) {
      circleArcDistance = scaler/6;
    }

    arcDis = ((scaler*0.5) - circleArcDistance) / aNumArcs;
    arcStrokeWeight = arcDis*0.7;




    in = minim.getLineIn(Minim.STEREO, aNumArcs);
  }

  arcTracker = iCurrent[aNumArcsJ];
  armTracker = iCurrent[aNumArmsJ];

  if (normLeftInput > 0.00001) {
    allRotateDeg += spinSpeed + iDisplayCurrentOffset[spinSpeedJ];
  }
  else {
    allRotateDeg += 0.12;
  }

  allRotateReg = radians(allRotateDeg);
  rotate(allRotateReg);

  for (int i=0; i<in.bufferSize(); i++) {

    //Arc Setup
    strokeWeight(abs(round(arcStrokeWeight)));

    arcSize = circleArcDistance + i * (arcDis + arcStrokeWeight);

    //Calculate Max Degrees for Arms
    armRotate =360./aNumArms;
    armDegreesMax = armRotate - 5.;

    //Adjust Stroke Weight for few Arcs, many Arms
    if (armDegreesMax < arcStrokeWeight) {
      strokeWeight(armDegreesMax);
    }

    //Get Audio Inputs
    getAudioInputs(i);

    if (aNumArms == 1) {
      //Calculate Colors for Middle Arcs
      if (whiteLines == 0) {
        colorHue = map((normLeftInput + normRightInput)*0.5, 0, 0.8, 58, 2);
      }

      //Draw Middle Arcs
      rotate(radians(armRotate));

      if (whiteLines == 0) {
        stroke(colorHue, 80, 100);
      }

      arcDegM =  map((normLeftInput + normRightInput)/2, 0, 1, 0.1, armDegreesMax);
      arcCalcRegM = radians(arcDegM);
      arc(0, 0, arcSize, arcSize, -(arcCalcRegM/2)*(mulitplier + 1 + iDisplayCurrentOffset[7]), arcCalcRegM*(mulitplier + 1 + iDisplayCurrentOffset[7]));
    } 
    else if (aNumArms == 2 || aNumArms == 3) {

      //Calculate Colors for Right Arcs
      if (whiteLines == 0) {
        colorHue = map(normRightInput, 0, 0.8, 58, 2);
      }

      //Draw Right Arcs
      if (whiteLines == 0) {
        stroke(colorHue, 80, 100);
      }

      //Apply Arc Middle Offset
      if (arcRotationOffset != 0) {
        pushMatrix();

        rotate(random(0, normRightInput*arcRotationOffset));
      }

      //Draw Arcs
      arcDegR =  map(normRightInput, 0, 1, 0.1, armDegreesMax);
      arcCalcRegR = radians(arcDegR);
      arc(0, 0, arcSize, arcSize, -(arcCalcRegR/2)*(mulitplier + 1 + iDisplayCurrentOffset[7]), arcCalcRegR*(mulitplier + 1 + iDisplayCurrentOffset[7]));

      if (arcRotationOffset != 0) {
        popMatrix();
      }

      //Calculate Colors for Left Arcs
      if (whiteLines == 0) {
        colorHue = map(normLeftInput, 0, 0.8, 58, 2);
      }

      //Draw Left Arcs
      rotate(radians(armRotate));

      if (whiteLines == 0) {
        stroke(colorHue, 80, 100);
      }

      //Apply Arc Middle Offset
      if (arcRotationOffset != 0) {
        pushMatrix();

        rotate(random(0, normLeftInput*arcRotationOffset));
      }

      arcDegL =  map(normLeftInput, 0, 1, 0.1, armDegreesMax);
      arcCalcRegL = radians(arcDegL);
      arc(0, 0, arcSize, arcSize, -(arcCalcRegL/2)*(mulitplier + 1 + iDisplayCurrentOffset[7]), arcCalcRegL*(mulitplier + 1 + iDisplayCurrentOffset[7]));

      if (arcRotationOffset != 0) {
        popMatrix();
      }

      if (aNumArms == 3) {
        //Make Additional Arc Arms
        for (int a = 0; a < aNumArms; a++) {
          //Calculate Colors for Middle Arcs
          if (whiteLines == 0) {
            colorHue = map(normLeftInput, 0, 0.8, 58, 2);
          }

          //Draw Middle Arcs
          rotate(radians(armRotate));

          if (whiteLines == 0) {
            stroke(colorHue, 80, 100);
          }


          //Apply Arc Middle Offset
          if (arcRotationOffset != 0) {

            pushMatrix();

            rotate(random(0, ((normRightInput+normLeftInput)*0.5)*arcRotationOffset));
          }

          arcDegM =  map((normLeftInput + normRightInput)/2, 0, 1, 0.1, armDegreesMax);
          arcCalcRegM = radians(arcDegM);
          arc(0, 0, arcSize, arcSize, -(arcCalcRegM/2)*(mulitplier + 1 + iDisplayCurrentOffset[7]), arcCalcRegM*(mulitplier + 1 + iDisplayCurrentOffset[7]));

          if (arcRotationOffset != 0) {
            popMatrix();
          }
        }
      }
    }
    else {
      //Make Additional Arc Arms
      for (int a = 0; a < aNumArms; a++) {
        //Calculate Colors for Middle Arcs
        if (whiteLines == 0) {
          colorHue = map(normLeftInput, 0, 0.8, 58, 2);
        }

        //Draw Middle Arcs
        rotate(radians(armRotate));

        if (whiteLines == 0) {
          stroke(colorHue, 80, 100);
        }

        //Apply Arc Middle Offset
        if (arcRotationOffset != 0) {
          pushMatrix();

          rotate(random(0, ((normRightInput+normLeftInput)*0.5)*arcRotationOffset));
        }

        arcDegM =  map((normLeftInput + normRightInput)/2, 0, 1, 0.1, armDegreesMax);
        arcCalcRegM = radians(arcDegM);
        arc(0, 0, arcSize, arcSize, -(arcCalcRegM/2)*(mulitplier + 1 + iDisplayCurrentOffset[7]), arcCalcRegM*(mulitplier + 1 + iDisplayCurrentOffset[7]));

        if (arcRotationOffset != 0) {
          popMatrix();
        }
      }
    }
  }
}

