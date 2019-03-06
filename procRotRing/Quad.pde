class Quad {

  //color quadColor;
  
  Quad() {
      //quadColor = qColor;
  }
  
  void arrowSeries(int x, int y, float angle, int w, int h, int series, int spacing, color col1, color col2){
      int alpha = 150;
      pushMatrix();
      rotate(angle);
      for(int i=1; i < series; i++){
          pushMatrix();
          translate(x, y, -100);
          alpha = alpha - (i * alpha/series);
          println(alpha);
          fill(col1, alpha);
          quadArrow(w, h);
          x += w/2 + spacing;
          popMatrix();
      }
      popMatrix(); 
  }

  void quadArrow(int w, int h){
      noStroke();
      quad(0, 0, w/2, 0, w, h/2, w/2, h/2);
      quad(w/2, h/2, w, h/2, w/2, h, 0, h);
  }
  
  void rectSeries(int x, int y, int x2, int y2, int series, int spacing, color col1, color col2, boolean solid){
      for(int i=0; i < series; i++){
        pushMatrix();
        translate(x, y, 0);
        float gradRange = map(i, 0, series, 0.0, 1.0);
        color gradient = lerpColor(col1, col2, gradRange);
        if(solid){
            fill(gradient);
            noStroke();
        }
        else{
            stroke(gradient);
            noFill();
        }
        rectShape(x2, y2);
        popMatrix();
        x = x + x2 + spacing;
      }
  }
  
  void rectShape(int x2, int y2){
      //noFill();
      strokeWeight(1);
      rect(0, 0, x2, y2);
  }
}
