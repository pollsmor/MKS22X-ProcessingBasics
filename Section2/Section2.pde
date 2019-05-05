int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
}

void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  fill(255, 0, 0); //red
  triangle(v1x, v1y, v2x, v2y, v3x, v3y); //original red triangle
  
  if (levels == 0) 
    return;
   
   //White cutout
  fill(255); //white
  float bottomX = (v1x + v2x)/ 2;
  float bottomY = v1y;
  float topLeftX = (v1x + bottomX) / 2;
  float topLeftY = (v1y + v3y) / 2;
  float topRightX = (bottomX + v2x) / 2;
  float topRightY = topLeftY;
  triangle(bottomX, bottomY, topLeftX, topLeftY, topRightX, topRightY);
  
  //Bottom left triangle
  float bottomLeftv1x = v1x;
  float bottomLeftv1y = v1y;
  float bottomLeftv2x = bottomX;
  float bottomLeftv2y = bottomY;
  float bottomLeftv3x = topLeftX;
  float bottomLeftv3y = topLeftY;
  
  //Bottom right triangle
  float bottomRightv1x = bottomX;
  float bottomRightv1y = bottomY;
  float bottomRightv2x = v2x;
  float bottomRightv2y = v2y;
  float bottomRightv3x = topRightX;
  float bottomRightv3y = topRightY;
  
  //Top triangle
  float topv1x = topLeftX;
  float topv1y = topLeftY;
  float topv2x = topRightX;
  float topv2y = topRightY;
  float topv3x = v3x;
  float topv3y = v3y;
  
  gasket(levels - 1, bottomLeftv1x, bottomLeftv1y, bottomLeftv2x, bottomLeftv2y, bottomLeftv3x, bottomLeftv3y);
  gasket(levels - 1, bottomRightv1x, bottomRightv1y, bottomRightv2x, bottomRightv2y, bottomRightv3x, bottomRightv3y);
  gasket(levels - 1, topv1x, topv1y, topv2x, topv2y, topv3x, topv3y);
}

void koch(int levels, float x1, float y1, float x2, float y2) {
  rectMode(CORNERS);
  fill(255);
  rect(x1, y1, x2, y2);
  
  stroke(255, 0, 0);
  line(x1, y1, x2, y2);
  
  float middleLeftX = (x2 + x1) / 3;
  float middleLeftY = (y2 + y1) / 3;
  float middleRightX = (x2 + x1) * 2 / 3;
  float middleRightY = (y2 + y1) * 2 / 3;
  
  stroke(0, 255, 0);
  line(middleLeftX, middleLeftY, middleRightX, middleRightY);
}

double distance(float x1, float y1, float x2, float y2) {
  return Math.sqrt( (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) );
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);

  gasket(levels, 0, height - 10, width, height - 10, width / 2, 10);

  //koch(levels, width - 10, height / 2, 10, height / 3 ); 
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
