class Apple {
  float x;
  float y;
  float size;
  
  Apple(float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
  }
  
  void show() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }
}