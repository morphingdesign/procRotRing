import tracer.paths.*;
import tracer.*;

color blackSolid = color(0);
color blackGrad0 = color(0, 0);
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

int numOfCircuits = 25;
Circuit[] circuit = new Circuit[numOfCircuits];
MultiPath[] circuitPath = new MultiPath[numOfCircuits];
Tracer blipTracer;
Blip[] circuitBlip = new Blip[numOfCircuits];

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
   
   for(int i=0; i < numOfCircuits; i++){
      circuit[i] = new Circuit(i);
      circuitPath[i] = circuit[i].mPath();
      circuitBlip[i] = new Blip(blipTracer, circuitPath[i]);
   }
}

void draw() {
   // update
   for(int i=0; i < numOfCircuits; i++){
      circuitBlip[i].blipStep();
   }
  
   background(blackSolid);  
   pushMatrix();
   translate(0, 0, -1);
   backGrid.rectGrid(0, 0, whiteGrad15, 40);
   backGrid.rectGrid(0, 0, whiteGrad50, 240);
   
   arrows.arrowSeries(-110, -80, 0, 40, 80, 36, 10, whiteSolid, blueSolid);
   arrows.arrowSeries(-width-100, -height-110, PI, 80, 160, 12, 40, whiteSolid, blueSolid);

   blocks.rectSeries(200, height - 200, 4, 10, 25, 5, whiteGrad15, whiteGrad50, false);
   blocks.rectSeries(5, 150, 10, 30, 15, 5, whiteGrad15, whiteGrad50, false);
   blocks.rectSeries(150, 270, 12, 25, 4, 20, whiteGrad50, whiteGrad50, true);
   popMatrix();
   
   pushMatrix();
   translate(0, 0, -600);
   
   backGrid.radialGradient(width/2, height/2, 0, 792, blackGrad0, blueSolid150);
   backGrid.radialGradient(width/2, height/2, 995, 1150, blueSolid150, blackGrad0);
   
   mainLock.rotArc();
   popMatrix();
   
   pushMatrix();
   translate(0, 0, 170);
   backGrid.radialGrid(width/2, height/2, 810, 10, 2, 1, 1, whiteGrad50, true);
   backGrid.radialGrid(width/2, height/2, 790, -5, 1, 1, 1, whiteGrad50, true);
   popMatrix();
   
   
   pushMatrix();
   translate(width/2, height/2, 1);
   //int ran = int(random(0,1));
   for(int i=0; i < numOfCircuits; i++){
      circuitPath[i].draw(g);
      circuit[i].drawPts();
      circuitBlip[i].renderBlip(numOfCircuits);
   }
   popMatrix();
   
}
