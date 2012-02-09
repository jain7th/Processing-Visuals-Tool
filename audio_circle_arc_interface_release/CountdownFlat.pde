class CountdownFlat {
  PImage counter;
  PGraphics counterMask;
  PFont font;

  int counterMaskSize = ceil(scaler*0.7);
  float counterMaskXPos;
  float counterMaskYPos;
  int counterMaskAlpha = 100;
  float counterMaskTime;
  float arcDeg;
  int numLines;
  float colorHue;



  CountdownFlat() {
    counterMaskXPos = counterMaskSize*0.5;
    counterMaskYPos = counterMaskSize*0.5;

    numLines = 60;

    counter = createImage(counterMaskSize, counterMaskSize, HSB);

    font = createFont("NettoOT-Bold", counterMaskSize*0.55*0.8);

    counterMask = createGraphics(counterMaskSize, counterMaskSize, JAVA2D);

    counterMask.beginDraw();
    counterMask.textFont(font);
    counterMask.textAlign(CENTER);
    counterMask.colorMode(HSB, 100);
    counterMask.smooth();
    counterMask.endDraw();
  }

  void startCounter(float _counterMaskTime) {
    counterMaskTime = (_counterMaskTime*60*1000) + millis();
  }

  void drawCounter() {
    //set counter color
    colorHue = map(counterMaskTime - millis(), 0, counterMaskTime, 58, 2);

    for (int i = 0; i < counter.pixels.length; i++) {
      counter.pixels[i] = color(colorHue, 80, 100);
    }

    //draw counterMask mask
    counterMask.beginDraw();
    counterMask.background(0, 0, 0);
    counterMask.noStroke();
    counterMask.strokeCap(SQUARE);

    //draw base ellipse
    counterMask.fill(0, 0, counterMaskAlpha);
    counterMask.ellipse(counterMaskXPos, counterMaskYPos, counterMaskSize*0.85*0.8, counterMaskSize*0.85*0.8);

    //draw counter arc
    counterMask.strokeWeight(counterMaskSize*0.2*0.8);
    counterMask.stroke(0, 0, counterMaskAlpha);

    arcDeg = map(counterMaskTime - millis(), 0, counterMaskTime, 0, 360);

    counterMask.arc(counterMaskXPos, counterMaskYPos, counterMaskSize*0.9*0.8, counterMaskSize*0.9*0.8, 0, radians(arcDeg));
    counterMask.noStroke();

    //draw counter lines
    counterMask.pushMatrix();
    counterMask.translate(counterMaskXPos, counterMaskYPos);

    counterMask.strokeWeight(counterMaskSize*0.009*0.8);
    counterMask.stroke(0, 0, 0);

    for (int i = 0; i < floor(map((counterMaskTime - millis())%60000, 0, 60000, 0, numLines)); i++) {
      counterMask.line(0, counterMaskSize*0.4*0.8, 0, counterMaskSize*0.39*0.8);
      counterMask.rotate(radians(360/numLines));
    }

    counterMask.noStroke();
    counterMask.popMatrix();

    //draw counter text
    counterMask.fill(0, 0, 0);

    if (counterMaskTime >= millis() && counterMaskTime - millis() > 1000000) {
      counterMask.textSize(counterMaskSize*0.21*0.8);
      counterMask.text(int((counterMaskTime - millis())/1000), counterMaskXPos, counterMaskYPos + counterMaskSize*0.55*0.16*0.8);
    } 
    else if (counterMaskTime >= millis() && counterMaskTime - millis() > 100000) {
      counterMask.textSize(counterMaskSize*0.38*0.8);
      counterMask.text(int((counterMaskTime - millis())/1000), counterMaskXPos, counterMaskYPos + counterMaskSize*0.55*0.26*0.8);
    } 
    else if (counterMaskTime >= millis()) {
      counterMask.textSize(counterMaskSize*0.55*0.8);
      counterMask.text(int((counterMaskTime - millis())/1000), counterMaskXPos, counterMaskYPos + counterMaskSize*0.55*0.36*0.8);
    } 
    else {
      counterMask.text(0, counterMaskXPos, counterMaskYPos + counterMaskSize*0.55*0.35*0.8);
    }

    counterMask.endDraw();

    counter.mask(counterMask);
    image(counter, -counterMaskSize*0.5, -counterMaskSize*0.5);
  }
}

