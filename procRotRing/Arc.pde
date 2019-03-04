class Arc {

  int firstAngle;
  int secondAngle;
  int angle;
  int outDiameter;
  int inDiameter;
  color fillColor;
  color strokeColor;

  Arc(int oDia, int iDia, int fAngle, int sAngle, int ang, color fColor, color sColor) {
    outDiameter = oDia;
    inDiameter = iDia;
    firstAngle = fAngle;
    secondAngle = sAngle;
    angle = ang;
    fillColor = fColor;
    strokeColor = sColor;
  }

  void rotateArc(float direction){
    pushMatrix();
      rotate(radians((angle++) * direction));
      createSolid();
    popMatrix();
  }

  void createSolid(){
      noStroke();
      fill(fillColor);
      arc(0, 0, outDiameter, outDiameter, radians(firstAngle), radians(secondAngle), PIE); 
      fill(blackSolid);
      arc(0, 0, inDiameter, inDiameter, radians(firstAngle), radians(secondAngle), OPEN);
      noStroke();
      ellipse(0, 0, inDiameter, inDiameter); 
  }

}
