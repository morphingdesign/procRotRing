color blackSolid = color(0, 255);
color blueSolid = color(0, 0, 255, 50);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteSolid = color(255, 50);

Lock mainLock = new Lock();
Grid backGrid;

void setup() {
   size(1080, 1080, P3D);
   smooth(8);
   
   backGrid = new Grid();
   
}

void draw() {
   background(blackSolid);

   backGrid.radialGradient(width/2, height/2, 800, whiteSolid, blackSolid);
   backGrid.radialGrid(width/2, height/2, 800, -5, 2, 1, 1, whiteSolid, true);
   backGrid.rectGrid(0, 0, whiteSolid, 40);
   mainLock.rotArc();
}





  
