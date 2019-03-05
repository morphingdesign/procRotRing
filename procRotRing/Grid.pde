// Class for grid construction
class Grid {  
  
  // Class Variables
  int spacing;  
  color bkgdGridColor = (50);

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
 
  Grid(){  
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  
  
  // *******************************************************
  // Create rectangular grid
  void rectGrid(int x, int y, int bkgdGridColor, int gridSpace){
    pushMatrix();
    strokeWeight(1);
    stroke(bkgdGridColor);
    translate(x, y, 0);
    // Horizontal Lines
    for(int i=0; i < height; i+=gridSpace){
       line(0, i, width, i);
    }
    // Vertical Lines
    for(int i=0; i < width; i+=gridSpace){
       line(i, 0, i, height);
    }
    popMatrix();
  }
  
  // *******************************************************
  // 
  void radialGrid(int x, int y, int diameter, int projection, int interval, int ringWeight, int tickWeight, color gridColor, boolean ticks){
    int lineLength;
    pushMatrix();
    translate(x, y, 0);
    noFill();
    strokeWeight(ringWeight);
    stroke(gridColor);
    ellipse(0, 0, diameter, diameter);
    if(ticks){
       lineLength = diameter/2 - projection;
    }
    else{
       lineLength = 0;
    }
    for(int i = 0; i < 360; i+=interval){
      stroke(gridColor);
      strokeWeight(tickWeight);
      rotate(radians(i));
      line(lineLength, 0, diameter/2, 0);
      rotate(radians(-i));
    }
    popMatrix();
  }  
  
  
  // *******************************************************
  // 
  void radialGradient(float x, float y, int radius, color inColor, color outColor){
    pushMatrix();
    translate(x, y, 0);
    for (int r = 0; r < radius; r++) {
      float gradRange = map(r, 0, radius, 0.0, 1.0);
      color gradient = lerpColor(inColor, outColor, gradRange);
      noFill();
      stroke(gradient);
      ellipse(0, 0, r, r);
    }
    popMatrix();
  }  
}  
