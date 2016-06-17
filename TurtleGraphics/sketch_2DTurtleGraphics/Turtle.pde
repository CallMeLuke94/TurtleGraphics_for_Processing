class Turtle {
  float size;
  float x;
  float y;
  boolean logo;
  boolean tail;
  color tailColor = color(255, 0, 0);
  float currentThickness = 1;
  PVector pos;
  PVector dir;
  ArrayList<PVector> positions = new ArrayList<PVector>();
  ArrayList<PVector> directions = new ArrayList<PVector>();

  Turtle (float size_, float x_, float y_, PVector dir_, boolean logo_, boolean tail_) {
    size = size_;
    x = x_;
    y = y_;
    dir = dir_;
    logo = logo_;
    tail = tail_;
    pos = new PVector(x, y);
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void display() {
    if (tail) {
      tail();
    }
    if (logo) {
      displayTurtle();
    }
  }

  void displayTurtle() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading()+PI/2);
    fill(255);
    noStroke();
    logo(size/100);
    popMatrix();
  }

  void tail() {
    noFill();
    strokeWeight(currentThickness);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    stroke(tailColor);
    beginShape();
    for (PVector vect : positions) {
      vertex(vect.x, vect.y);
    }
    endShape();
  }

  void forward(float l) {
    dir.normalize();
    pos.add(dir.mult(l));
    positions.add(pos.copy());
  }

  void backward(float l) {
    dir.normalize();
    pos.add(dir.mult(-l));
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void turnLeft(float angle) {
    dir.rotate(-radians(angle));
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void turnRight(float angle) {
    dir.rotate(radians(angle));
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void push() {
  }

  void pop() {
  }

  void reset() {
    pos = positions.get(0);
    dir = directions.get(0);
    positions.clear();
    directions.clear();
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void setPos(float X, float Y) {
    pos = new PVector(X, Y);
    positions.add(pos.copy());
  }

  void setDir(PVector newDir) {
    dir = newDir;
    directions.add(dir.copy());
  }

  void setSize(float newSize) {
    size = newSize;
  }

  void setColour(int r, int g, int b) {
    tailColor = color(r, g, b);
  }

  void setWeight(float w) {
    currentThickness = w;
  }

  void boundary(String condition) {
    if (condition == "RANDOM") {
      if (pos.y < 0 || pos.y > height || pos.x < 0 || pos.x > width) {
        reset();
        setPos(random(width), random(height));
        setDir(PVector.random2D());
      }
    } else if (condition == "RESET") {
      if (pos.y < 0 || pos.y > height || pos.x < 0 || pos.x > width) {
        reset();
      }
    } else {
    }
  }
}