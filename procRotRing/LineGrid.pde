class LineGrid {

  // Line controls
  int x = width -90;        // Set x position of the vertical line
  int yStart, yEnd;
  int iterationStatic = 0;
  float moveAdd, moveSub, movePos;
  float moveStat = 0;
  float angle;
  int numOfMoveLines = 6;
  float[] centerPtPos;
  float[] shiftVar;
  color lineColor;
  color textColor;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  LineGrid(color lineColor, color textColor) {
     this.lineColor = lineColor;
     this.textColor = textColor;
     yStart = 0;
     yEnd = height;
     
     centerPtPos = new float[numOfMoveLines];
     shiftVar = new float[numOfMoveLines];
     for(int i=0; i < centerPtPos.length; i++){
        centerPtPos[i] = random(height/4, height/2);
        shiftVar[i] = random(0, TWO_PI);
     }     
  }
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawLineGrid(){
     pushMatrix();
     translate(x, 0);
     stroke(lineColor);
     strokeWeight(1);
     line(0, yStart, 0, yEnd);
     staticLineIteration(40, -10);
     moveLineIteration();
     popMatrix();  
  }
  
  // *******************************************************
  // 
  void staticLineIteration(int numOfLines, int lineLength){
     int spacing = (height + 1)/numOfLines;
     pushMatrix();
     stroke(lineColor);
     translate(0, moveStat);
     for(int i=-height; i < numOfLines + 1; i++){
        line(0, i * iterationStatic, lineLength, i * iterationStatic);
        iterationStatic = 0;
        iterationStatic+=spacing;
     }
     popMatrix();
     if(moveStat == height){
        moveStat = 0;
     }
     else{
        moveStat++;
     }
  }
  
  // *******************************************************
  // 
  void moveLineIteration(){
     for(int i=0; i < centerPtPos.length; i++){
        moveLine(centerPtPos[i], height/2, .5, 20, shiftVar[i]);
     }
  }
  
  // *******************************************************
  // 
  void moveLine(float centerPt, int range, float iteration, int lineLength, float shift){    // Iteration parameter defines speed
     float ang1 = radians(angle);
     movePos = centerPt + (range * sin(ang1 + shift));
     pushMatrix();
     translate(0, movePos);
     stroke(lineColor);
     line(0, 0, lineLength, 0);
     stroke(textColor);
     float factor = 0.5;
     float numValue = height / movePos * factor;
     String numVal = nf(numValue, 2, 3);
     textAlign(LEFT, CENTER);
     text(numVal, lineLength + 5, -2);
     
     angle+=iteration;
     popMatrix();
  }
}
