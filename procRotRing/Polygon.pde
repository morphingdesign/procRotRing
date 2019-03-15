// Class for polygon with gradient
class Polygon {  
  
  // Class Variables
  String[] textLine; 
  color textColor;
  
  int maxThickness;
  color strokeColor;
  float alphaOne = 0; 
  float alphaLast;
  
  Gradient gradColor;
  Graphics[] polygon;
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct polygon with gradient
  Polygon(int widthPolygon, int numberOfSides, int maxThickness, color strokeColor){
      this.maxThickness = maxThickness;
      this.strokeColor = strokeColor;    
      //this.textColor = textColor;
      
      gradColor = new Gradient(strokeColor, 255, 150);
      
      polygon = new Graphics[maxThickness * 2];
      
      for(int i=0; i < maxThickness; i++){
         int gradRange = gradColor.renderGrad(i, maxThickness);
         float lastPt = i;
         alphaLast = map(lastPt, 0, maxThickness, 0.0, 255.0);
          polygon[i] = new Graphics(widthPolygon + i, numberOfSides, gradRange, int(alphaLast), false);
      }
      
      for(int i=maxThickness; i < maxThickness * 2; i++){
         int gradRange = gradColor.renderGrad(i, maxThickness);
         float lastPt = i;
         alphaLast = map(lastPt, maxThickness, maxThickness * 2, 255.0, 0.0);
          polygon[i] = new Graphics(widthPolygon + i, numberOfSides, gradRange, int(alphaLast), false);
      }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawPoly(int x, int y){
    for(int i=0; i < maxThickness * 2; i++){
       polygon[i].drawPolygon(x, y);
    }
  } 
}  
