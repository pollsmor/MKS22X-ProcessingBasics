int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

class Visualizer {
  int length = 400; //size of main rectangle
  int width = 200;
  int bars;
  float x, y, lineY, barWidth; //top left of main rectangle
  float[] values;
  float[] speeds;
  Visualizer(float x, float y, int bars) {
    this.x = x;
    this.y = y;
    this.bars = bars;
    lineY = y + width / 2; //Middle dividing line
    barWidth = length / bars;
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    fill(255);
    rect(x, y, length, width);
    line(x, lineY, x + length, lineY);

    float barX = x; //to track where on the x-axis the bar is
    
    for (int i = 0; i < values.length; ++i) {
      if (values[i] >= 50 && values[i] <= 100) //green
        fill(0, 255, 0);
        
      else if (values[i] >= 0 && values[i] < 50) //yellow
        fill(255, 255, 0);
        
      else if (values[i] >= -50 && values[i] < 0) //orange
        fill(255, 165, 0);
        
      else //red
        fill(255, 0, 0);
       
      rect(barX, lineY, barWidth, - values[i]); //starting point is the top left
      
      barX += barWidth; //move along the x-axis
    }
  }
    
  void update() {
    for (int i = 0; i < values.length; ++i) {
      if (lineY - values[i] < y || lineY - values[i] > y + width)
        speeds[i] = - speeds[i]; //reverse speeds
      
      values[i] += speeds[i];
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 40);
}

void draw() {
  background(255);
  v.display();
  v.update();
}