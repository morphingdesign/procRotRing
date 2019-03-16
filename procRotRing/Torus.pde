// Class for math geometry construction
class Torus {  
  
  // Class Variables
  int numPts0 = 500;
  int numPts1 = 1000;
  PVector[] torus0 = new PVector[numPts0];
  PVector[] torus1 = new PVector[numPts1];
  float animSpeed = 0.03;  // Speed multiplier for intro screen animation of math geo
  
  int scalar = 20;
  float spacing = 0.25;
  float xShift = 0;
  float iteration = 0.125;
  
  // Torus
  float u, v;
  float dia = 330;
  float radius = 100;
  
  // Torus Knot
  float varR = dia;
  float varRr = radius - 5;
  float varP = 41;
  float varQ = 25;
  
  float time = 0;
  
  int hotSpotStartX = 0;
  int hotSpotEndX =  width;
  int hotSpotStartY = 0;
  int hotSpotEndY = height;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct the math geo
  Torus(){ 
    float x, y, z;
        // Standard torus, lines
        for(int i=0; i < torus1.length; i++){
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // Formula for Spiral Torus source citation below:
            // http://www.3d-meier.de/Tut2/Seite9.html
            // Formula is used to create the x, y, z points
            x = (varR + varRr * cos(varP * time)) * cos(varQ * time);
            y = (varR + varRr * cos(varP * time)) * sin(varQ * time);
            z = varRr * sin(varP * time);
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++       
            time+=.05;
            torus1[i] = new PVector(x, y, z);
          }
          // Rotating torus, points
          for(int i=0; i < torus0.length; i++){
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // Formula for Spiral Torus source citation below:
            // http://www.3d-meier.de/Tut2/Seite9.html
            // Formula is used to create the x, y, z points
            float u = map(i, -TWO_PI, TWO_PI, 0, torus0.length);
            float v = map(i, 0, PI, 0, torus0.length);
            x = (dia + radius * cos(v)) * cos(u); 
            y = (dia + radius * cos(v)) * sin(u);
            z = radius * sin(v);
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++       
            torus0[i] = new PVector(x, y, z);  
          }
  }  
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Creates a Torus
  void drawShape(){
    pushMatrix();
    translate(width/2, height/2, 0);  // Place geometry at canvas center and closer to 
    //if(mouseX > hotSpotStartX &&  mouseX < hotSpotEndX && mouseY > hotSpotStartY && mouseY < hotSpotEndY){  
    //   rotateY(frameCount * 0.003 + mouseX * 0.003);
    //   rotateX(mouseY * 0.003);            
    //}
    rotateX(frameCount * animSpeed);    // ....foreground by translating z-axis
    //rotateY(frameCount * animSpeed);    // Rotate geometry around all axes and sync with
    rotateY(radians(40));
    rotateZ(frameCount * -animSpeed);    // .... frame count
    stroke(whiteSolid);
    strokeWeight(1);
    int alpha = 10;
    //noStroke();
    int numOfSpirals = 15;
    for(int i=1; i < numOfSpirals + 1; i++){
        pushMatrix();
        rotateZ(radians(5 * i));
        int gradient = int(map(alpha, 0, numOfSpirals, 10, 100));
        stroke(blueSolid, gradient);
        strokeWeight(i);
        for(int j=0; j < torus0.length; j++){
          point(torus0[j].x, torus0[j].y, torus0[j].z);
        }
        popMatrix();  
    }
    
    for(int i=0; i < torus1.length; i++){
      //point(torus1[i].x, torus1[i].y, torus1[i].z);
    }
    
    noFill();
    stroke(whiteSolid, 20);
    strokeWeight(1);
    beginShape();
    curveVertex(torus1[0].x, torus1[0].y, torus1[0].z);
    curveVertex(torus1[0].x, torus1[0].y, torus1[0].z);
    for(int i=1; i < torus1.length; i++){
       curveVertex(torus1[i].x, torus1[i].y, torus1[i].z);
    }
    curveVertex(torus1[torus1.length-1].x, torus1[torus1.length-1].y, torus1[torus1.length-1].z);
    endShape();    
    popMatrix();
  }
}  
