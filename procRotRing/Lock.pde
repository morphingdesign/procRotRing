class Lock {

  Arc[] arcShape = new Arc[21];
  
  int dia1Out = 1080 - 20;
  int dia1In = dia1Out - 40;
  int dia2Out = dia1In - 10;
  int dia2In = dia2Out - 2;
  int dia3Out = dia2In - 10;
  int dia3In = dia3Out - 40;
  int dia4Out = dia3In - 10;
  int dia4In = dia4Out - 2;
  int dia5Out = dia4In - 10;
  int dia5In = dia5Out - 20;

  Lock() {
  // Ring1
     // Solids
     arcShape[0] = new Arc(dia1Out, dia1In, 0, 90, 0, whiteGrad50); 
     arcShape[1] = new Arc(dia1Out, dia1In, 94, 98, 0, whiteGrad50);
     arcShape[2] = new Arc(dia1Out, dia1In, 100, 104, 0, whiteGrad50); 
     
     arcShape[3] = new Arc(dia1Out, dia1In, 140, 200, 0, whiteGrad50); 
     
     arcShape[4] = new Arc(dia1Out, dia1In, 220, 250, 0, whiteGrad50); 
     arcShape[5] = new Arc(dia1Out, dia1In, 254, 258, 0, whiteGrad50);
     arcShape[6] = new Arc(dia1Out, dia1In, 260, 262, 0, whiteGrad50);
     
     arcShape[7] = new Arc(dia1Out, dia1In, 290, 330, 0, whiteGrad50); 
     arcShape[8] = new Arc(dia1Out, dia1In, 334, 336, 0, whiteGrad50);
     arcShape[9] = new Arc(dia1Out, dia1In, 338, 340, 0, whiteGrad50);
     
     // Ring2
     // Lines
     arcShape[10] = new Arc(dia2Out, dia2In, 30, 140, 0, whiteGrad50);
     arcShape[11] = new Arc(dia2Out, dia2In, 220, 310, 0, whiteGrad50);
     
     // Ring3
     // Outlines
     arcShape[12] = new Arc(dia3Out, dia3In, 0, 90, 0, whiteGrad50);
     arcShape[13] = new Arc(dia3Out, dia3In, 110, 120, 0, whiteGrad50);
     arcShape[14] = new Arc(dia3Out, dia3In, 125, 135, 0, whiteGrad50);
     // Outlines
     arcShape[15] = new Arc(dia3Out, dia3In, 180, 230, 0, whiteGrad50); 
     // Solids
     arcShape[16] = new Arc(dia3Out, dia3In, 280, 320, 0, whiteGrad50);
     // Outlines
     arcShape[17] = new Arc(dia3Out, dia3In, 325, 340, 0, whiteGrad50);
     
     // Ring4
     // Lines
     arcShape[18] = new Arc(dia4Out, dia4In, 80, 150, 0, whiteGrad50);
     arcShape[19] = new Arc(dia4Out, dia4In, 280, 350, 0, whiteGrad50);
     
     // Ring5
     // Solids
     arcShape[20] = new Arc(dia5Out, dia5In, 170, 270, 0, whiteGrad50);
  }

  void rotArc(){
  
     pushMatrix();
     translate(width/2, height/2, -100);  
     arcShape[0].rotateArc(1, 0); 
     arcShape[1].rotateArc(1, 0);
     arcShape[2].rotateArc(1, 0);
     
     arcShape[3].rotateArc(1, 0);
     
     arcShape[4].rotateArc(1, 0);   
     arcShape[5].rotateArc(1, 0);
     arcShape[6].rotateArc(1, 0);
     
     arcShape[7].rotateArc(1, 0);   
     arcShape[8].rotateArc(1, 0);
     arcShape[9].rotateArc(1, 0);
     
     arcShape[10].rotateArc(-1, 0);
     arcShape[11].rotateArc(-1, 0);
     
     arcShape[12].rotateArc(-2, 1);
     arcShape[13].rotateArc(-2, 1);
     arcShape[14].rotateArc(-2, 1);
     
     arcShape[15].rotateArc(-2, 0);
     arcShape[16].rotateArc(-2, 1);
     arcShape[17].rotateArc(-2, 0);
     
     arcShape[18].rotateArc(-1, 0);
     arcShape[19].rotateArc(-1, 0);
     
     arcShape[20].rotateArc(2, 0);
     popMatrix();
  }


}
