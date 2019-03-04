color blackSolid = color(0);
color blueSolid = color(0, 0, 255, 50);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteSolid = color(255, 50);

Arc[] arcShape = new Arc[50];
//int[] rotAngles = new int[50];





void setup() {
   size(400, 400);
   smooth(8);
   
   arcShape[0] = new Arc(400, 360, 0, 90, 0, blueSolid, whiteSolid); 
   arcShape[1] = new Arc(400, 360, 94, 98, 0, blueSolid, whiteSolid);
   arcShape[2] = new Arc(400, 360, 100, 104, 0, blueSolid, whiteSolid); 
   
   arcShape[3] = new Arc(400, 360, 140, 200, 0, blueSolid, whiteSolid); 
   
   arcShape[4] = new Arc(400, 360, 220, 250, 0, redSolid, whiteSolid); 
   arcShape[5] = new Arc(400, 360, 254, 258, 0, redSolid, whiteSolid);
   arcShape[6] = new Arc(400, 360, 260, 262, 0, redSolid, whiteSolid);
   
   arcShape[7] = new Arc(400, 360, 290, 330, 0, blueSolid, whiteSolid); 
   arcShape[8] = new Arc(400, 360, 334, 336, 0, blueSolid, whiteSolid);
   arcShape[9] = new Arc(400, 360, 338, 340, 0, blueSolid, whiteSolid);
   
   // Lines
   arcShape[10] = new Arc(355, 354, 30, 140, 0, blueSolid, blueSolid);
   arcShape[11] = new Arc(355, 354, 220, 310, 0, blueSolid, blueSolid);
   
}

void draw() {
   background(blackSolid);
   pushMatrix();
   translate(width/2, height/2);
   //noStroke();
   //stroke(greenSolid);
   //fill(blueSolid, 100);
  
   arcShape[0].rotateArc(1, false); 
   arcShape[1].rotateArc(1, false);
   arcShape[2].rotateArc(1, false);
   
   arcShape[3].rotateArc(1, true);
   
   arcShape[4].rotateArc(1, false);   
   arcShape[5].rotateArc(1, false);
   arcShape[6].rotateArc(1, false);
   
   arcShape[7].rotateArc(1, true);   
   arcShape[8].rotateArc(1, true);
   arcShape[9].rotateArc(1, true);
   
   arcShape[10].rotateArc(-1, true);
   arcShape[11].rotateArc(-1, true);
   
   
   
   
   popMatrix();
}





  
