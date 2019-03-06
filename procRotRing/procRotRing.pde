color blackSolid = color(0);
color blueGrad50 = color(0, 0, 255, 50);
color blueGrad10 = color(0, 0, 255, 10);
color blueSolid = color(0, 0, 255);
color blueSolid150 = color(0, 0, 150);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteGrad50 = color(255, 50);
color whiteGrad15 = color(255, 15);
color whiteGrad5 = color(255, 5);
color whiteSolid = color(255);

Lock mainLock = new Lock();
Grid backGrid;
Quad arrows;
Quad blocks;

void setup() {
   size(1920, 1080, P3D);
   smooth(8);
   
   backGrid = new Grid();
   arrows = new Quad();
   blocks = new Quad();
}

void draw() {
   background(blackSolid);  
   
   arrows.arrowSeries(-110, -80, 0, 40, 80, 22, 10, whiteSolid, blueSolid);
   arrows.arrowSeries(-width-100, -height-100, PI, 80, 160, 10, 40, whiteSolid, blueSolid);

   blocks.rectSeries(200, height - 200, 4, 10, 25, 5, whiteGrad15, whiteGrad50, false);
   blocks.rectSeries(5, 150, 10, 30, 15, 5, whiteGrad15, whiteGrad50, false);
   blocks.rectSeries(100, 200, 15, 25, 4, 20, whiteGrad50, whiteGrad50, true);
   
   backGrid.radialGradient(width/2, height/2, 0, 790, blackSolid, blueSolid150);
   backGrid.radialGradient(width/2, height/2, 1000, 1150, blueSolid150, blackSolid);
   
   backGrid.radialGrid(width/2, height/2, 810, 10, 2, 1, 1, whiteGrad50, true);
   backGrid.radialGrid(width/2, height/2, 790, -5, 1, 1, 1, whiteGrad50, true);
   backGrid.rectGrid(0, 0, whiteGrad15, 40);
   backGrid.rectGrid(0, 0, whiteGrad50, 240);
   mainLock.rotArc();
}
