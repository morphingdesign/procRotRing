color blackSolid = color(0);
color blueGrad = color(0, 0, 255, 50);
color blueSolid = color(0, 0, 255);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteGrad50 = color(255, 50);
color whiteGrad15 = color(255, 15);
color whiteSolid = color(255);

Lock mainLock = new Lock();
Grid backGrid;
Quad arrows;

void setup() {
   size(1080, 1080, P3D);
   smooth(8);
   
   backGrid = new Grid();
   arrows = new Quad(whiteSolid);
}

void draw() {
   background(blackSolid);  
   
   arrows.initShape(-100, -100);
   
   pushMatrix();
   rotate(PI);
   arrows.initShape(-width-100, -height-100);
   popMatrix();
   
   backGrid.radialGradient(width/2, height/2, 0, 800, whiteGrad50, blackSolid);
   backGrid.radialGrid(width/2, height/2, 810, 10, 2, 1, 1, whiteGrad50, true);
   backGrid.radialGrid(width/2, height/2, 790, -5, 1, 1, 1, whiteGrad50, true);
   backGrid.rectGrid(0, 0, whiteGrad15, 40);
   backGrid.rectGrid(0, 0, whiteGrad50, 240);
   mainLock.rotArc();
}
