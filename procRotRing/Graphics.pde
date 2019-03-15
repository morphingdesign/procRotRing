// Class for polygon shape creation
class Graphics {  
  
  // Class Variables
  PShape s;                // The PShape object
  PVector[] pts;
  color shapeColor;
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct screen graphics on intro and main page screens
  Graphics(int widthPolygon, int numOfSides, color shapeColor, int shapeAlpha, boolean fillShape){
      this.shapeColor = shapeColor;      
      pts = new PVector[numOfSides];
      float angle = 0;  
      //println("angle[first]: " + angle);
      for(int i=1; i < pts.length + 1; i++){
         float x = widthPolygon * cos(angle);
         float y = widthPolygon * sin(angle);
         pts[i - 1] = new PVector(x, y);
         angle = (TWO_PI / numOfSides) * i;
         //println("pt[" + i + "]: (" + pts[i - 1].x + ", " + pts[i - 1].y + ")");
         //println("pt[" + i + "]: (" + angle + ")");
      }
      s = createShape();
      s.beginShape();
      if(fillShape){
         s.fill(shapeColor);
      }
      else{
         s.noFill();
      }
      s.stroke(shapeColor, shapeAlpha);
      s.strokeWeight(1);
      for(int i=0; i < numOfSides; i++){
         s.vertex(pts[i].x, pts[i].y);
      }
      s.endShape(CLOSE);
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Render graphics that are consistent between both intro and main program screens
  void drawPolygon(int x, int y){
    pushMatrix();
    translate(x, y);
    shape(s, 0, 0);      // 0, 0 denotes center point position
    // Used to display points
    /**
    noFill();
    stroke(shapeColor);
    strokeWeight(4);
    for(int i=0; i < pts.length; i++){
         point(pts[i].x, pts[i].y);
    } 
    **/
    popMatrix();
  }
}
