PVector UP = new PVector(0, -1);
PVector DOWN = new PVector(0, 1);
PVector LEFT = new PVector(-1, 0);
PVector RIGHT = new PVector(1, 0);

Turtle[] turtles = new Turtle[100];

void setup() {
  size(800, 600);
  //fullScreen();
  background(255);
  //frameRate(10);
  
  for (int i = 0; i < turtles.length; i++){
    turtles[i] = new Turtle(random(50), random(width), random(height), PVector.random2D(), false, true);
    turtles[i].setColour(int(random(255)), int(random(255)), int(random(255)));
    turtles[i].setWeight(2);
    turtles[i].reset();
  }
  
}

void draw() {
  //noLoop();
  background(255);
  
  for (Turtle i : turtles){
    i.forward(5);
    i.turnLeft(random(-360, 360));
    i.display();
  }

}

void mousePressed() {
  for (Turtle i : turtles){
    i.reset();
  }
  redraw();
}

void keyPressed() {
  //save("image.png");
  println("image saved");
}