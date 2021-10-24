class Food {
  float x;
  float y;
  Food(float _x, float _y) {
    x=_x;
    y=_y;
  }

  void update() {
    x+=velX;
  }
  void display() {
    image(honey, x, y);
    //ellipse(x,y,10,10);
  }

}
