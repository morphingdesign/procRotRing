// Class for circuit construction
class Blip {

  // Class Variables  
  int maxRad = 3;
  Tracer traceBlip;
  Gradient gradColor;
  MultiPath tracePath;
  float tStart = 0;
  float tSpeed = 0.01;
  float alphaOne = 0; 
  float alphaLast;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Blip(Tracer t, MultiPath tPath) {
      this.traceBlip = t;     
      this.tracePath = tPath;
      gradColor = new Gradient(blueSolid, 255, 0);
      traceBlip = new Tracer(tracePath, tStart, tSpeed);
  }
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void renderBlip(int maxPt){
    pushMatrix();
    translate(0, 0, 0);
    ellipseMode(RADIUS);
    for(float i=0; i < maxRad; i++){
       int gradRange = gradColor.renderGrad(int(i), int(maxRad));
       float lastPt = i;
       alphaLast = map(lastPt, 0, maxPt, 0.0, maxRad);
       if(alphaOne != alphaLast){  
           alphaOne++;                      
        }                                   
        else{                              
           alphaOne = 0;                   
        }
        stroke(gradRange, alphaOne);
        noFill();
        ellipse(traceBlip.x, traceBlip.y, i, i);
    }
    popMatrix(); 
  }
  
  
  
  void blipStep(){
    pushMatrix();
    translate(0, 0, 0);
    traceBlip.step();
    popMatrix();
  }
  
  
    
}
