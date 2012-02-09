import ddf.minim.*;

Countdown count;
CountdownFlat countFlat;

//Global Variables
float rightInput = 0;
float normRightInput;
float rightInputTracker = 0;
float leftInput = 0;
float normLeftInput;
float leftInputTracker = 0;
float ellipseSize;
float allRotateDeg = 1;
float colorHue = 0;
int fullscreen = 0;
int randValues = 0;
float iBaseSteps;
int barUserShort;
int barUser;
float barCurrent;
float descBoxHeight;
int scaler;
boolean paused = false;
int audioEffect = 0;
boolean audioEffectTracker = false;
boolean mouseClickedTracker = false;
int mouseColorTrans;
int iScrollOffset = 0;
int iSrollPosTracker = 0;
int mouseWheelDeltaOld = 0;
int mouseWheelDeltaNorm;
boolean iInterfaceItemHover;
int FadeOutTracker;
float normFadeOutTracker;
float lineScrollHeight;
float lineScrollOffset;
float scrollBarFadeTracker;
int iFadeOutValueBase = 5;

//Arcs Global Variables
int aNumArcs = 9;
int aNumArms = 3;
int mulitplier = 0;
int numSkipFrames = 0;
int spinSpeed = 11;
int randomInterval = 0;
int randomEffectInterval = 0;
int arcRotationOffset = 0;
float arcStrokeWeight;
float circleArcDistance;
float arcDis;
float arcSize;
float armRotate;
float armDegreesMax;
float allRotateReg;
float arcDegM;
float arcCalcRegM;
float arcDegR;
float arcCalcRegR;
float arcDegL;
float arcCalcRegL;
int arcTracker = aNumArcs;
int armTracker = aNumArms;

//Bars Global Variables
int bNumBars = 20;
int bBarPosOffset = 0;
int bRotUpdate = 0;
float bStrokeWeight;
float bBarRotation;
int bNumBarsTracker;
float bInnerRadius;
float bOuterRadius;
float bBarLength;
float bBarMaxLength;
float normInputs;
int bRotUpdateTracker = 0;
float[] bValues = new float[500];

//Lines Global Variables
int lNumPoints = 100;
int lNumPointsMax = 500;
int lNumHistory = 5;
int lNumHistoryMax = 10;
int lHistoryOffset = 22;
float lHistoryDistance;
float lHistoryDistanceBase = 10;
float lMaxRadius;
float lMinRadius;
int lNumPointsTracker;
float lPointAngle;
int lI;
int lI2;
int lI3;
float lP1X = 0;
float lP1Y = 0;
float lP2X;
float lP2Y;
float[] lValues = new float[lNumPointsMax * (lNumHistoryMax + 2)];
int lStrokeWeight = 2;
float lColorHue;

//Countdown Variables
int cMinutes = 10;
int cShowCountdown = 0;
int cEffect = 0;

//General Settings
int interpolate = 0;
int whiteLines = 0;
int fadeOut = 0;

//Button Positions & Data Positions
int randJ;
int audioEffectJ;
int audioEffectRandJ;
int aNumArcsJ;
int aNumArmsJ;
int bNumBarsJ;
int bBarPosOffsetJ;
int spinSpeedJ;
int arcRotationOffsetJ;
int bRotUpdateJ;
int numSkipFramesJ;
int randValuesJ;
int randomIntervalJ;
int mulitplierJ;
int interpolateJ;
int whiteLinesJ;
int fadeOutJ;
int lNumPointsJ;
int lNumHistoryJ;
int lHistoryOffsetJ;
int lHistoryDistanceBaseJ;
int cMinutesJ;
int cShowCountdownJ;
int cEffectJ;

//Set Settings Interface Size
int iWidth = 300;
int iHeight = screen.height;

//Set Settings Interface Colors
color iCoBackground = color(60, 255);
color iCoBackgroundAlpha = color(60, 0);
color iCoBackgroundActive = color(35, 220);
color iCoBackgroundActiveAlpha = color(35, 0);
color iCoCLickable = color(60, 115, 200, 255);
color iCoCLickableAlpha = color(60, 115, 200, 0);
color iCo = color(180);
color iCoAlpha = color(180, 0);
color iCoActive = color(230);
color iFadeOut;
color scrollBarCol;

//Set Settings Interface Elements Position
int iMainYOffset;
int iMainXOffset = 32;

//Set Settings Interface Element Sizes
int iTypeSizeBig = 12;
int iTypeSizeSma = 10;
int iBarHeight = 10;
int iBarWidth = 200;
int iItemHeight = 37;
int iItemDistance = 30;
int iBarOffset = 20;

//Hovered Item Tracker
int activeItem = -1;
int j;

//Demo Playing Tracker
boolean demoPlayerTracker = false;

//Create Settings Interfaces Item Arrays
int iArrayLength = 30;

String[] iName = new String[iArrayLength];
int[] iMin = new int[iArrayLength];
int[] iMax = new int[iArrayLength];
int[] iCurrent = new int[iArrayLength];
String[] iIndex = new String[iArrayLength];
int[] iX1 = new int[iArrayLength];
int[] iY1 = new int[iArrayLength];
int[] iX2 = new int[iArrayLength];
int[] iY2 = new int[iArrayLength];
int[] iButton = new int[iArrayLength];
String[] iDesc = new String[iArrayLength];
int[] iSpacer = new int[iArrayLength];
int[] iHideCurrent = new int[iArrayLength];
int[] iDisplayCurrentOffset = new int[iArrayLength];
float[] iFadeOutValue = new float[iArrayLength];

//Create Effects Arrays
String[] iEName = new String[3];
int[] iEIndex = new int[3];

//Create Countdown Names Array
String[] cNames = new String[2];

int iEIndexNum = 0;
int iNumItems = 0;

//Set Up Audio
Minim minim;
AudioInput in;
AudioInput in1;
AudioPlayer song;

//Set up Fonts
PFont aFontBig;
PFont aFontSma;
PFont cFontBig;

boolean drawInterfaceBaseImagesBool = true;

//=======================================================================SETUP
void setup() {
  //size(screen.width, screen.height);
  size(1280, 720);

  //Set up Arcs
  colorMode(HSB, 100);
  frameRate(30);

  minim = new Minim(this);

  //Auto Scaling
  scaler = min(width, height);

  //Set up Countdowns
  count = new Countdown();
  countFlat = new CountdownFlat();

  //TOO SLOW
  //  //Set Up Interface Item Fade Out Array
  //  iFadeOutColors = new color[ceil(iWidth * height*0.2 + iWidth*height*0.02 + 100)];

  //Audio Arc Auto Scaler
  setupArcsScaling();

  //Set up Audio Bars
  setupAudioBars();

  //Set up Audio Lines
  setupAudioLines();

  //Load demo song
  song = minim.loadFile("song.mp3");
  
  //Play demo song
  song.play();
  demoPlayerTracker = true;

  in = minim.getLineIn(Minim.STEREO, aNumArcs);
  in1 = minim.getLineIn(Minim.MONO, 1);

  //Create Font
  aFontBig = createFont("SansSerif", iTypeSizeBig);
  aFontSma = createFont("SansSerif", iTypeSizeSma);
  cFontBig = createFont("NettoOT-Bold", scaler*0.2);

  //Calculate Settings Interface Items Top Offset
  iMainYOffset = floor((height - (iNumItems * ( iItemHeight + iItemDistance ))) / 10);

  //Load Interface Item Variables
  applyInterfaceItems();

  //Load Effects List
  loadEffects();

  //load Countdown Effect Names
  loadCountdownNames();

  noFill();

  //Add mouseWheel Listener
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
}


//=======================================================================DRAW
void draw() {
  //write framerate to window frame
  frame.setTitle("Audio Arcs Interface, " + int(frameRate) + " fps");

  //Update Drawing Variables
  applyValues();

  //Update Values After Effects Change
  if (audioEffectTracker == true) {
    applyInterfaceItems();
    setItemCoordinates();

    //Audio Arc Auto Scaler
    setupArcsScaling();

    //Set up Audio Bars
    setupAudioBars();

    //Set up Audio Lines
    setupAudioLines();
  }

  //Set Background Transparency
  if (iCurrent[fadeOutJ] == 1) {
    fill(0, 40);
  } 
  else {
    fill(0, 100);
  }

  //Draw Background
  noStroke();
  rect(0, 0, screen.width, screen.height);
  noFill();

  noCursor();

  stroke(90);

  pushMatrix();
  translate(width*0.5, height*0.5);
  smooth();

  if (frameCount%80 == 0 && cShowCountdown == 1) {
    cShowCountdown = count.checkCountdown();
  }

  if (cShowCountdown == 0) {
    switch(audioEffect) {
    case 0:  
      drawAudioArcs();
      break;
    case 1:
      drawAudioBars();
      break;
    case 2:
      drawAudioLines();
      break;
    }
  }
  else if (cShowCountdown == 1) {
    if (cEffect == 0) count.drawCountdown();
    if (cEffect == 1) countFlat.drawCounter();
  } 


  popMatrix();

  //Settings Interface

  noSmooth();
  strokeWeight(1);

  //Check Settings Interface Hover
  if (mouseX >= 0 && mouseX <= iWidth + 40 && mouseY >= 0 && mouseY <= iHeight && width >= iWidth + 200 && height >= 400) {
    drawSettingsInterface();
  }
  noFill();

  audioEffectTracker = false;
}

void drawSettingsInterface() {
  pushMatrix();

  //Draw Settings Interface Background
  fill(iCoBackground);
  noStroke();
  rect(0, 0, iWidth, iHeight);

  //TOO SLOW
  //  //Get and write Top Pixel Colors into an Array
  //  for (int iBGet = 0; iBGet < iWidth * height*0.2; iBGet++) {
  //
  //    if (iBGet >= iWidth) {
  //      iFadeOutColors[iBGet] = get(iBGet%iWidth, iBGet/iWidth);
  //    } 
  //    else {
  //      iFadeOutColors[iBGet] = get(iBGet, 0);
  //    }
  //  }


  //Draw Interface Items
  drawInterface();

  //Draw Mouse
  smooth();
  mouseColorTrans = (mouseClickedTracker) ? 90:50;
  fill(90, mouseColorTrans);
  stroke(90, mouseColorTrans);
  ellipse(mouseX, mouseY, 20, 20);
  mouseClickedTracker = false;

  popMatrix();

  //  saveFrame("audio_circle_arc_interface-####.tga");
}

void applyValues() {
  spinSpeed = iCurrent[spinSpeedJ];
  numSkipFrames = iCurrent[numSkipFramesJ] + iDisplayCurrentOffset[numSkipFramesJ];
  randomInterval = iCurrent[randomIntervalJ] + iDisplayCurrentOffset[randomIntervalJ];
  interpolate = iCurrent[interpolateJ] + iDisplayCurrentOffset[interpolateJ];
  mulitplier = iCurrent[mulitplierJ];
  whiteLines = iCurrent[whiteLinesJ] + iDisplayCurrentOffset[whiteLinesJ];
  randomEffectInterval = iCurrent[audioEffectRandJ];
  cMinutes = iCurrent[cMinutesJ];

  //Apply Values Randomizer
  if (randomInterval != 0 && cShowCountdown == 0) {
    if (frameCount%(randomInterval*5) == 1) {
      randomizer();
    }
  }

  //Apply Effect Randomizer
  if (randomEffectInterval != 0  && cShowCountdown == 0) {
    if (frameCount%(randomEffectInterval*5) == 1) {
      audioEffectTracker = true;
      effectRandomizer();
    }
  }
}


void setItemCoordinates() {
  iX1[j] = iMainXOffset;

  if (j==0) {
    iY1[j] = iMainYOffset + 20;
  }
  else {
    iY1[j] = iY2[j-1] + iItemDistance;
  }
  iX2[j] = iWidth - iMainXOffset;
  iY2[j] = iY1[j] + iItemHeight;

  //Reduce Button Fields Size
  if (iButton[j] == 1 || iSpacer[j] == 1) {
    iY2[j] = iY1[j] + floor(iItemHeight*0.5);
  }

  //Set Extra Button Variables
  if (iIndex[j] == "randValues") {
    randJ = j;
  } 
  else if (iIndex[j] == "interpolate") {
    interpolateJ = j;
  } 
  else if (iIndex[j] == "whiteLines") {
    whiteLinesJ = j;
  } 
  else if (iIndex[j] == "fadeOut") {
    fadeOutJ = j;
  }
}

void setupArcsScaling() {
  circleArcDistance = scaler/6;
  arcDis = ((scaler*0.5) - circleArcDistance) / aNumArcs;
  arcStrokeWeight = arcDis*0.8;
}


void randomizer() {
  for (int d = 0; d < randJ; d++) {
    iCurrent[d] = round(random(iMin[d], iMax[d]*0.7));
    delay(10);
  }
}

void effectRandomizer() {
  audioEffect = round(random(0, iEIndexNum-1));
  delay(10);
}



void getAudioInputs(int x) {
  if (rightInputTracker <= abs(in.right.get(x))) rightInputTracker = rightInput;
  if (leftInputTracker <= abs(in.left.get(x))) leftInputTracker = leftInput;

  //Turn Interpolation of Arcs Off  
  if (interpolate == 0) {
    rightInput = (demoPlayerTracker) ? abs(song.right.get(x)):abs(in.right.get(x));
    leftInput = (demoPlayerTracker) ? abs(song.left.get(x)):abs(in.left.get(x));
  }

  if (frameCount%(numSkipFrames + 1) == 0) {
    //Right Arc
    normRightInput = (demoPlayerTracker) ? (rightInput + abs(song.right.get(x)))/2:(rightInput + abs(in.right.get(x)))/2;
    rightInput = (demoPlayerTracker) ? abs(song.right.get(x)):abs(in.right.get(x));

    //Left Arc
    normLeftInput = (demoPlayerTracker) ? (leftInput + abs(song.left.get(x)))/2:(leftInput + abs(in.left.get(x)))/2;
    leftInput = (demoPlayerTracker) ? abs(song.left.get(x)):abs(in.left.get(x));
  }

  //Soft Updates
  rightInput = rightInputTracker*0.9;
  leftInput = leftInputTracker*0.9;
}

void stop() {
  in.close();
  song.close();
  minim.stop();

  super.stop();
} 

