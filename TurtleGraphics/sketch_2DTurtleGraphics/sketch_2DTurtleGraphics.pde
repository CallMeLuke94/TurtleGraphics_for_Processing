int step = 25;
int total = 0;

int population = 1;

Turtle[] turtles = new Turtle[population];

void setup() {
  size(800, 600);
  //fullScreen();
  background(255);
  frameRate(2);

  for (int i = 0; i < turtles.length; i++) {
    turtles[i] = new Turtle(i*width/population + width/2, height, 90);
    turtles[i].setColour(int(random(255)), int(random(255)), int(random(255)));
    turtles[i].setWeight(2);
    turtles[i].reset();
    //turtles[i].noTail();
  }
}

void draw() {
  noLoop();
  background(255);

  for (Turtle i : turtles) {


    //i.trnTo(mouseX, mouseY);
    //i.fwd(step);

    i.fwd(step);
    for (int j = 0; j < total; j++) {
      i.push();
      if (j % 2 == 0) {
        i.trn(90);
      } else {
        i.trn(-90);
      }
      i.fwd(step);
    }
    for (int j = 0; j < total; j++) {
      i.pop();
    }
    for (int j = 0; j < total; j++) {
      i.push();
      if (j % 2 == 0) {
        i.trn(-90);
      } else {
        i.trn(90);
      }
      i.fwd(step);
    }
    for (int j = 0; j < total; j++) {
      i.pop();
    }
    for (int j = 0; j < total; j++) {
      if (j % 2 == 1) {
        i.fwd(step);
      }
    }

    //i.logo(30);
    //i.reset();
  }
  //total++;
}

void mousePressed() {
  for (Turtle i : turtles) {
    i.reset();
    //i.setColour(int(random(255)), int(random(255)), int(random(255)));
    //i.setDir(radians(random(-110, -70)));
  }
  total++;
  redraw();
}

void keyPressed() {
  //save("image.png");
  //println("image saved");
}