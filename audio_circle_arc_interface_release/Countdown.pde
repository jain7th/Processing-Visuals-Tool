class Countdown {
  float cMinutes;
  int millisBase;
  float CountdownArcDegTotal;
  float CountdownArcDegSec;
  float CountdownArcDegMin;
  float maxPos;
  float minPos;
  float timeCount;
  int timeDisplay;
  float colorHue;

  Countdown() {
  }

  void startCoundown(float x) {
    cMinutes = x;
    millisBase = millis();
    maxPos = cMinutes * 60 * 1000;
    minPos = 0;
  }

  void drawCountdown() {
    timeCount = millis() - millisBase;

    //Set Arc Lenght    
    CountdownArcDegTotal = map(timeCount, minPos, maxPos, 350, 0);
    CountdownArcDegSec = map(timeCount, minPos, maxPos, 0, CountdownArcDegTotal - 10);
    CountdownArcDegMin = map(60000 - timeCount%60000, 60000, 0, CountdownArcDegTotal + 5, 0);


    pushMatrix();
    rotate(radians(355 - CountdownArcDegTotal*0.52));

    noFill();
    strokeWeight(scaler*0.05);

    //Draw Inner Arc, Total Time mapped to Middle Arc
    colorHue = map(CountdownArcDegTotal, 350, 0, 58, 2);
    stroke(colorHue, 80, 100);
    arc(0, 0, scaler*0.484, scaler*0.484, 0, radians(CountdownArcDegSec));

    rotate(radians(-10));

    //Draw Middle Arc, Total Time mapped to 350 Degrees
    arc(0, 0, scaler*0.592, scaler*0.592, 0, radians(CountdownArcDegTotal));

    rotate(radians(-10));

    //Draw Outer Arc, each minute mapped to 350 degrees
    colorHue = map(CountdownArcDegMin, 350, 0, 58, 2);
    stroke(colorHue, 80, 100);
    arc(0, 0, scaler*0.7, scaler*0.7, 0, radians(CountdownArcDegMin));

    popMatrix();

    textFont(cFontBig);
    colorHue = map(CountdownArcDegTotal, 350, 0, 58, 2);
    fill(colorHue, 80, 100);

    timeDisplay = ceil((maxPos - timeCount)/60000);
    textAlign(LEFT);
    text(timeDisplay, 0 + scaler*0.35, 0 - scaler*0.3);
  }

  int checkCountdown() {
    if (millis() >= cMinutes*60*1000 + millisBase) {
      return 0;
    } 
    else {
      return 1;
    }
  }
}

