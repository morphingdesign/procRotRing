// Class for circuit construction
class Circuit {

  // Class Variables  
  PVector[] pts;
  int numOfPts = 700;
  int x, y;
  int iteration1 = 20;
  int iteration2 = iteration1 * 2;
  int randomSeed;
  
  Point ptStart, ptEnd;
  Line circuitLine;
  Path circuitPath;
  MultiPath mCircuitPath;
  Gradient ptGradColor; 
  Gradient pathGradColor;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Circuit(int randomSeed) {
     mCircuitPath = new MultiPath();
     ptGradColor = new Gradient(whiteSolid, 255, 100);
     pathGradColor = new Gradient(whiteSolid, 200, 5);
     this.randomSeed = randomSeed;
     randomSeed(randomSeed);
     
     PVector previousPt, currentPt;
     pts = new PVector[numOfPts];
     pts[0] = new PVector(0, 0);
     for(int i=1; i < pts.length; i++){
       previousPt = pts[i - 1];
       pts[i] = pathDir(int(previousPt.x), int(previousPt.y));
       currentPt = pts[i];
       
       

       
       println("Test currentPt[" + i + "]: (" + currentPt.x + ", " + currentPt.y + ")");
       
       
       //for(int j=0; j < i; j++){
           //pts[i] = compare(i, j);
          
           
          
           ptStart = new Point(previousPt.x, previousPt.y);
           ptEnd = new Point(currentPt.x, currentPt.y);
           
           println("Updated currentPt[" + i + "]: (" + currentPt.x + ", " + currentPt.y + ")");
           
           circuitLine = new Line(ptStart, ptEnd);
           circuitPath = circuitLine;
           
           int pathGradient = pathGradColor.renderGrad(i, pts.length);
           
           mCircuitPath.setStrokeColor(pathGradient);
           mCircuitPath.setStrokeWeight(1);
           mCircuitPath.add(circuitPath);
       //}
       
       
       
       
       
       
       
       
    }
  }
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawPaths(){
     
     
  }
  
  
  // *******************************************************
  // 
  void drawPts(){
      strokeWeight(2);
      for(int i=0; i < pts.length; i++){
          int gradient = ptGradColor.renderGrad(i, pts.length);
          stroke(gradient);
          point(pts[i].x, pts[i].y);
      }
  }
  
  // *******************************************************
  // 
  MultiPath mPath(){
    return mCircuitPath;
  }
  
  
  
  
  
  PVector compare(int current, int iteration){
        PVector revPt = new PVector();
        float currentPtX = pts[current].x;
        float currentPtY = pts[current].y;
        float matchPtX = pts[iteration].x;
        float matchPtY = pts[iteration].y;
        float previousPtX = pts[current - 1].x;
        float previousPtY = pts[current - 1].y;
        if((currentPtX == matchPtX) && (currentPtY == matchPtY)){
          println("point[" + current + "]: Point match found");
          println("pointX[" + current + "]: (" + currentPtX + ", prevPtx[" + iteration + "]: (" + matchPtX + ")");
          println("pointY[" + current + "]: (" + currentPtY + ", prevPty[" + iteration + "]: (" + matchPtY + ")");
          revPt = pathDir(int(currentPtX), int(currentPtY));
        }
        return revPt;
  }
  
  
  PVector pathDir(int x, int y){
      int dir = int(random(0, 9));
      int valueX = x;
      int valueY = y;
      PVector value;
      switch(dir){
          case 0:
              valueX+=iteration1;
              break;
          case 1:
              valueX+=iteration2;
              break;
          case 2:
              valueY+=iteration1;
              break;
          case 3:
              valueY+=iteration2;
              break;
          case 4:
              valueX-=iteration1;
              break;
          case 5:
              valueX-=iteration2;
              break;
          case 6:
              valueY-=iteration1;
              break;
          case 7:
              valueY-=iteration2;
              break;    
          default:
              break;
      }
      value = new PVector(valueX, valueY);
      return value;
  }
  
 
}
