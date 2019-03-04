color backgroundColor = color(255);
color blueSolid = color(0, 0, 255);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  


int[] firstAngle = new int[10];
int[] secondAngle = new int[10];
int[] angle = new int[10];
int[] outDiameter = new int[10];
int[] inDiameter = new int[10];



//int firstAngle = int(random(10, 350));
//int secondAngle = int(random(200, 350));
//int angle = int(random(30, 160));
//int outDiameter = int(random(180, 200));
//int inDiameter = int(random(outDiameter - 40, outDiameter - 60));  

  
//int outDia = int(random(30, 200));
//int intDia = int(random(outDia - 10, outDia - 5));



void setup() {
   size(400, 400);
   //frameRate(5);
   for(int i=0; i < firstAngle.length; i++){
      firstAngle[i] = int(random(10, 30));
      secondAngle[i] = int(random(80, 100));
      angle[i] = int(random(10, 90));
      outDiameter[i] = int(random(120, 200));
      inDiameter[i] = outDiameter[i] - 30;
      //inDiameter[i] = 20; 
   }
   
     
   
}

void draw() {
   background(backgroundColor);
   pushMatrix();
   translate(width/2, height/2);
   noStroke();
   //stroke(0);
   fill(blueSolid);
   //float speed = second();
   //float speed = frameRate / second();
   //for(int i = 0; i < firstAngle.length; i++){    
   for(int i = 0; i < 1; i++){  
      rotate(radians((angle[i] ++)));
      //arc(0, 0, 200, 200, radians(10), radians(360));
      arc(0, 0, outDiameter[i], outDiameter[i], radians(firstAngle[i]), radians(secondAngle[i]));    // Create pie slices
      println(i + ": " + outDiameter[i] + " , " + inDiameter[i] + " , " + firstAngle[i] + " , " + secondAngle[i] + " , " + angle[i]);
      fill(backgroundColor);
      ellipse(0, 0, inDiameter[i], inDiameter[i]); 
      rotate(0);
   }
   fill(greenSolid);
   
   for(int i = 1; i < 2; i++){  
      rotate(radians((angle[i] ++)));
      //arc(0, 0, 200, 200, radians(10), radians(360));
      arc(0, 0, outDiameter[i], outDiameter[i], radians(firstAngle[i]), radians(secondAngle[i]));    // Create pie slices
      println(i + ": " + outDiameter[i] + " , " + inDiameter[i] + " , " + firstAngle[i] + " , " + secondAngle[i] + " , " + angle[i]);
      fill(backgroundColor);
      ellipse(0, 0, inDiameter[i], inDiameter[i]); 
      rotate(0);
   }
   fill(redSolid);
   
   for(int i = 2; i < 3; i++){  
      rotate(radians((angle[i] ++)));
      //arc(0, 0, 200, 200, radians(10), radians(360));
      arc(0, 0, outDiameter[i], outDiameter[i], radians(firstAngle[i]), radians(secondAngle[i]));    // Create pie slices
      println(i + ": " + outDiameter[i] + " , " + inDiameter[i] + " , " + firstAngle[i] + " , " + secondAngle[i] + " , " + angle[i]);
      fill(backgroundColor);
      ellipse(0, 0, inDiameter[i], inDiameter[i]); 
      rotate(0);
   }
   popMatrix();
}





void createCogDetail(color createCogColor){

  //rotate(radians((angle)));  // Rotate pie to align to axis
  
  //inDiameter = int(inDiameter * 0.8);
  for(int i = 0; i < firstAngle.length; i++){
    //int firstAngle = i - angle;
    //int secondAngle = i;
    
    arc(0, 0, outDiameter[i], outDiameter[i], radians(firstAngle[i]), radians(secondAngle[i]));    // Create pie slices
    println(outDiameter[i] + " , " + inDiameter[i] + " , " + firstAngle[i] + " , " + secondAngle[i] + " , " + angle[i]);
    fill(backgroundColor);
    //ellipse(0, 0, inDiameter[i], inDiameter[i]);          // Create inner pie fill circle
  }
  
}
