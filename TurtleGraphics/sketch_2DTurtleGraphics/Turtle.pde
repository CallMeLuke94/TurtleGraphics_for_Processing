//Turtle Class

class Turtle {
  float x;
  float y;
  boolean tail = true;
  color tailColor = color(255, 0, 0);
  float currentThickness = 1;
  PVector pos;
  PVector dir;
  ArrayList<PVector> positions = new ArrayList<PVector>();
  ArrayList<PVector> directions = new ArrayList<PVector>();
  ArrayList<Integer> pushes = new ArrayList<Integer>();
  int track = 0;

  Turtle (float x_, float y_, float dir_) {
    x = x_;
    y = y_;
    dir = PVector.fromAngle(radians(-dir_));
    pos = new PVector(x, y);
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void logo(float size) {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading()+PI/2);
    fill(255);
    noStroke();
    sprite(size/100);
    popMatrix();
  }

  void tail() {
    noFill();
    strokeWeight(currentThickness);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    stroke(tailColor);

    float prevX = positions.get(positions.size()-2).x;
    float prevY = positions.get(positions.size()-2).y;
    float currX = positions.get(positions.size()-1).x;
    float currY = positions.get(positions.size()-1).y;

    line(prevX, prevY, currX, currY);
  }

  void noTail() {
    tail = false;
  }

  void fwd(float l) {
    dir.normalize();
    pos.add(dir.copy().mult(l));
    positions.add(pos.copy());
    directions.add(dir.copy());

    if (tail) {
      tail();
    }
  }

  void trn(float angle) {
    dir.rotate(radians(angle));
    dir.normalize();
    positions.add(pos.copy());
    directions.add(dir.copy());

    if (tail) {
      tail();
    }
  }

  void push() {
    int save = positions.size();
    pushes.add(save);
  }

  void pop() {
    int saved = pushes.get(pushes.size()-1);
    PVector popP = positions.get(saved-1);
    PVector popD = directions.get(saved-1);
    setPos(popP.x, popP.y);
    setDir(popD);

    int countdown = 0;
    while (countdown < saved-track) {
      positions.remove(positions.size()-1);
      directions.remove(positions.size()-1);
      countdown++;
    }

    pushes.remove(pushes.size()-1);
    track++;
  }

  void reset() {
    pos = positions.get(0);
    dir = directions.get(0);
    positions.clear();
    directions.clear();
    positions.add(pos.copy());
    directions.add(dir.copy());
  }

  void randomise() {
    pos = new PVector(random(width), random(height));
    dir = PVector.random2D();
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

  void setAngle(float angle) {
    dir = PVector.fromAngle(radians(angle-90));
    directions.add(dir.copy());
  }

  void trnTo(float x, float y) {
    PVector target = new PVector(x, y);
    PVector newDir = PVector.sub(target, pos);
    setDir(newDir);
  }

  void setColour(int r, int g, int b) {
    tailColor = color(r, g, b);
  }

  void setWeight(float w) {
    currentThickness = w;
  }

  void atBoundary(String condition) {
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
    } else if (condition == "BOUNCE") {
      if (pos.y < 0 || pos.y > height) {
        setDir(new PVector(dir.x, -dir.y));
      } else if (pos.x < 0 || pos.x > width) {
        setDir(new PVector(-dir.x, dir.y));
      }
    } else {
    }
  }
}