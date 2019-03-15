// Class for screen HUD graphics construction
class Textbox {  
  
  // Class Variables
  String[] textLine; 
  int x;
  int y;
  int w;
  int h;
  int margin;
  int lLength;
  color strokeColor;
  color textColor;
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct screen graphics on intro and main page screens
  Textbox(int x, int y, int w, int h, int margin, int lLength, color strokeColor, int textColor){
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.margin = margin;
      this.lLength = lLength;
      this.strokeColor = strokeColor;    
      this.textColor = textColor;
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
 
  // *******************************************************
  // Create individual curves depicted with glyph characters
  void drawText(){    // Alpha parameter to allow varying transparency
    pushMatrix();
    translate(x + margin * 2, y + margin * 2);
    int arrayLength;   // Defines length of curve
    int charSpacing = 8;
    int heightSpacing = 16;
    int numOfRows = (h - margin * 2) / heightSpacing;
    int maxWidth = (w - margin * 3) / charSpacing;
    //textFont(playFont, 32);            // Apply new font "Play"
    char[] glyph = new char[95];      // Create array of glpyhs using Unicode decimal
    for(int i = 0; i < 95; i++){      // ....values to render a variety of characters
      glyph[i] = (char)(33 + i);      // ....including the alphabet
    }
    PVector charList[];
    for(int j=0; j < numOfRows; j++){
        arrayLength = int(random(2, maxWidth));
        charList = new PVector[arrayLength];
        for(int i=0; i < arrayLength; i++){        // length
           charList[i] = new PVector();
           charList[i].x = charSpacing * i;  
           charList[i].y = j * heightSpacing; 
           //println("charList[" + i + "]: " + charList[i].x + ", " + charList[i].y);
           //point(charList[i].x, charList[i].y);
                                      // For each y value in vertex array, place a 
           textSize(10);                // ....random glyph from char array
           textAlign(CENTER, CENTER);   // Center glyph at each point position
           fill(textColor);     // Defines color and alpha for glyph
           text(glyph[int(random(0, 95))], charList[i].x, charList[i].y);  // Select random glyph
        } 
    }
    popMatrix();
  }
  
  // *******************************************************
  // Creates a single box with corner outlines
  void drawBoxOutline(){
    strokeWeight(1);
    stroke(strokeColor);
    pushMatrix();
    translate(x, y);           // Top left corner position
    // Top left corner
    line(margin, margin, margin + lLength, margin);    // Long horizontal line of corner
    line(margin, margin, margin, margin + lLength);    // Short vertical line of corner
    // Top right corner
    line(w - margin, margin, w - margin - lLength, margin);    
    line(w - margin, margin, w - margin, margin + lLength);
    // Bottom left corner
    line(margin, h - margin, margin, h - margin - lLength);
    line(margin, h - margin, margin + lLength, h - margin);
    // Bottom right corner
    line(w - margin, h - margin, w - margin - lLength, h - margin);
    line(w - margin, h - margin, w - margin, h - margin - lLength);
    
    popMatrix();
  } 
  
}  
