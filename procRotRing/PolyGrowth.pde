// Class for polygon growth
class PolyGrowth {  
  
  // Class Variables
  int numOfPolygons;
  Polygon[] polyShape;
  int geoWidth;
  int numOfSides;
  int thickness;
  int rings;
  int[] randVal;
  int[] growth;
  int polyXPos, polyYPos;
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct polygon growth
  PolyGrowth(int num, int w, int sides){
       numOfPolygons = num;
       geoWidth = w;
       numOfSides = sides;
       polyShape = new Polygon[numOfPolygons];
       thickness = int(geoWidth * 0.75);
       rings = numOfPolygons * 2;
       randVal = new int[polyShape.length];
       growth = new int[rings];
       
       
       for(int i=0; i < polyShape.length; i++){
          polyShape[i] = new Polygon(geoWidth, numOfSides, thickness, blueSolid);
          randVal[i] = int(random(0, 10));
       }
       int iterations = 0;
       for(int i=0; i < growth.length; i++){
          growth[i] = iterations;
          if(i % 20 == 0){
             iterations++;
          }
          else if(i % 30 == 0){
             iterations--;
          }
       }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawGrowth(int x, int y){
       pushMatrix();
       translate(x, y);
       for(int k=0; k < polyShape.length; k++){
            switch(randVal[k]){
               case 0:
                   polyXPos = ((geoWidth + thickness) * 2 * (growth[k])) * 2;
                   polyYPos = 0;
                   break;
               case 1:
                   polyXPos = (geoWidth + thickness) * 2 * (growth[k]);
                   polyYPos = geoWidth * 2 * (growth[k]);
                   break;   
               case 2:
                   polyXPos = 0;
                   polyYPos = geoWidth * 4 * (growth[k]);
                   break;   
               case 3:
                   polyXPos = -((geoWidth + thickness) * 2 * (growth[k])) * 2;
                   polyYPos = 0;
                   break; 
               case 4:
                   polyXPos = -(geoWidth + thickness) * 2 * (growth[k]);
                   polyYPos = -geoWidth * 2 * (growth[k]);
                   break; 
               case 5:
                   polyXPos = 0;
                   polyYPos = -geoWidth * 2 * (growth[k]);    
               case 6:
                   polyXPos = 0;
                   polyYPos = -geoWidth * 4 * (growth[k]);
                   break;   
               case 7:
                   polyXPos = (geoWidth + thickness) * 2 * (growth[k]);
                   polyYPos = -geoWidth * 2 * (growth[k]);
                   break;
               case 8:
                   polyXPos = -(geoWidth + thickness) * 2 * (growth[k]);
                   polyYPos = geoWidth * 2 * (growth[k]);
                   break;    
               default:
                   polyXPos = (geoWidth + thickness) * 2 * (growth[k]);
                   polyYPos = geoWidth * 2 * (growth[k]);
                   break;
            }
            polyShape[k].drawPoly(polyXPos, polyYPos);
       }
       popMatrix();
  } 
}  
