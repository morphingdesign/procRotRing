class Quad {

  color quadColor;
  
  Quad(color qColor) {
      quadColor = qColor;
  }
  
  void initShape(int x, int y){
      int alpha = 150;
      for(int i=1; i < 6; i+=1){
          pushMatrix();
          translate(x, y, -100);
          alpha = alpha - (i * 8);
          fill(quadColor, alpha);
          createSolid();
          popMatrix(); 
          x+=80;
      }
  }

  void createSolid(){
      noStroke();
      quad(0, 0, 40, 0, 80, 80, 40, 80);
      quad(40, 80, 80, 80, 40, 160, 0, 160);
  }
}
