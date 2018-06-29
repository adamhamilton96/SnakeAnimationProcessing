class Segment {
  PVector A = new PVector();
  PVector B = new PVector();
  PVector target = new PVector();
  PVector dir = new PVector();
  float len;
  float angle;
  float size = 8;
  Segment parent = null;
  
  Segment(float x, float y, float len_, float angle_) {
    A = new PVector(x, y);
    len = len_;
    size = 16;
    angle = angle_;
    calculateB();
  }
 
  Segment(Segment parent_, float len_, float angle_) {
    parent = parent_;
    A = parent.B.copy();
    len = len_;
    angle = angle_;
    calculateB();
  }
 
  void follow(float tx, float ty) {
    target.set(tx, ty);
    dir = PVector.sub(target, A);
    angle = dir.heading();
   
    dir.setMag(len);
    dir.mult(-1);
   
    A = PVector.add(target, dir);
  }
 
  void calculateB() {
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    B.set(A.x + dx, A.y + dy);
  }
 
  void show() {
    stroke(0, 255, 0);
    strokeWeight(size);
    if(size == 8) {
      line(A.x, A.y, B.x, B.y);
    } else {
      line(A.x, A.y, B.x, B.y);
      stroke(0);
      strokeWeight(1);
      fill(0);
      ellipse(A.x + 5, A.y + 4, 4, 4);
      ellipse(A.x + 5, A.y - 4, 4, 4);
    }
  }
}