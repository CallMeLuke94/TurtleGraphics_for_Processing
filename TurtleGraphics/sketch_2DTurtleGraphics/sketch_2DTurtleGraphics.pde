PVector UP = new PVector(0, -1);
PVector DOWN = new PVector(0, 1);
PVector LEFT = new PVector(-1, 0);
PVector RIGHT = new PVector(1, 0);

int step = 10;
int total = 0;

Turtle[] turtles = new Turtle[1];

void setup() {
  size(800, 600);
  //fullScreen();
  background(255);
  //frameRate(2);

  for (int i = 0; i < turtles.length; i++) {
    turtles[i] = new Turtle((30), (width/4), (height), UP, true, true);
    turtles[i].setColour(int(random(255)), int(random(255)), int(random(255)));
    turtles[i].setWeight(2);
    turtles[i].reset();
  }
}

void draw() {
  noLoop();
  background(255);

  for (Turtle i : turtles) {
    
    i.fwd(step);
    for (int j = 0; j < total; j++){
    i.push();
    if (j % 2 == 0){
        i.trn(90);
    } else {
      i.trn(-90);
    }
    i.fwd(step);
    }
    for (int j = 0; j < total; j++){
      i.pop();
    }
    i.fwd(step);

    //i.logo();

    //i.display();
  }
}

void mousePressed() {
  for (Turtle i : turtles) {
    i.reset();
    //i.setColour(int(random(255)), int(random(255)), int(random(255)));
    //i.setDir(PVector.fromAngle(radians(random(-110, -70))));
  }
  total++;
  redraw();
}

void keyPressed() {
  //save("image.png");
  //println("image saved");
}