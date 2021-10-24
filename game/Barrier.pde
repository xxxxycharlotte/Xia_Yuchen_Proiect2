class Barrier {
  float x;
  float y;
  int state;
  float w;
  float h;
  float leftx;
  float rightx;
  float upy;
  float buttomy;
  Barrier(float _x, float _y) {
    x=_x;
    y=_y;
    leftx=x-w/2;
    rightx=x+w/2;
    upy=y-h/2;
    buttomy=y+h/2;
    if (random(1)>0.5) {
      state=1;
      w=583;
      h=100;
    } else {
      state=2;
      w=333;
      h=100;
    }
  }

  void update() {
    x+=velX;
    leftx=x-w/2;
    rightx=x+w/2;
    upy=y-h/2;
    buttomy=y+h/2;
  }
  void display() {
    if (state==1) {
      image(barrier[0], x, y);
    } else {
      image(barrier[1], x, y);
    }
    //ellipse(x, y-50, 10, 10);
  }
  void touchBarrier() {
    if ((mybear.bearX>leftx)&&(mybear.bearX<rightx)&&(mybear.bearY+mybear.h/2>y-80)&&(mybear.bearX+mybear.w/2>leftx)) {
      //ellipse(x, y-50, 20, 20);
      mybear.upPressed =false;
      mybear.bearY=y-80-mybear.h/2;
      mybear.jumpVel=0;
    }
    mybear.touchBarrier=false;
    if ((mybear.buttomy>upy)&&(mybear.bearX+mybear.w/2>leftx)&&(mybear.bearX+mybear.w/2<rightx)) {
      mybear.touchBarrier=true;
      //mybear.upPressed =false;
      mybear.bearX=leftx-mybear.w/2;
      mybear.jumpVel=0;
      mybear.velx=0;
     
    } else {
      mybear.velx=velX;
    }
  }
}
