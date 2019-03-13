class Gradient {

  // Class Variables  
  color colorStart;
  color colorEnd;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Returns a gradient based on color parameter
  // Alpha start is opaque end and alpha end is most transparent end of gradient
  Gradient(color colorToGrad, int alphaStart, int alphaEnd) {
       colorStart = color(colorToGrad, alphaStart);  // Lower end of transparent color gradient
       colorEnd = color(colorToGrad, alphaEnd);  // Higher end of transparent color gradient     
  }
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Needs to be used within a loop to output the color in integer format
  int renderGrad(int iteration, int maxValue){
      float gradRange = map(iteration, 0, maxValue, 0.0, 1.0);  // Map arc angle between 0 and 1 gradient range
      color gradient = lerpColor(colorStart, colorEnd, gradRange);  // Vary the color
      return gradient;
  }
}
