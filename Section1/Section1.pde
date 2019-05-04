int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  int bars;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y, int bars) {
    this.x = x;
    this.y = y;
    this.bars = bars;
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
    
    values[0] = 1.0;
    values[1] = -2.0;
    values[2] = 4.0;
    values[3] = -8.0;
    values[4] = 16.0;
    values[5] = -32.0;
    values[6] = 48.0;
    values[7] = -64.0;
    values[8] = 80.0;
    values[9] = -96.0;
  }

  void display() {
    //Use this to adjust size of main rectangle
    int length = 400;
    int width = 200;
    fill(255);
    rect(x, y, length, width);
    
    //Middle dividing line
    float lineY = width / 2;
    line(x, lineY, x + length, lineY);

    float barWidth = length / bars;
    float barX = x; //to track where on the x-axis the bar is
    
    for (int i = 0; i < values.length; ++i) {
      if (Math.abs(values[i]) == values[i]) { //positive 
        fill(0, 255, 0); //green
        rect(barX, lineY - values[i], barWidth, values[i]); //starting point is the top left
      }
      
      else { //negative
        fill(255, 0, 0); //red
        rect(barX, lineY, barWidth, values[i]); //starting point is the middle left
      }
      
      barX += barWidth; //move along the x-axis
    }
  }
    
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.

      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 10);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
