class Bear {
  float bearX, bearY;
  boolean upPressed = false;
  float jumpVel=0;
  float jumpVelMax=30;
  float gravity=4;
  float ppy=0;
  float bearY0;
  float h=1469/12;
  float w=1264/6;
  boolean touchBarrier=false;
  float velx=0;
  float leftx, rightx, upy, buttomy;
  Bear() {
    bearX=width/2;
    bearY0=height/2+50;
    bearY=bearY0;
    velx=velX;
    rightx=bearX+w/2;
    buttomy=bearY+h/2;
  }
  void updateBear() {
    bearX-=velx;
    rightx=bearX+w/2;
    buttomy=bearY+h/2;

    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == UP) {
          upPressed = true;
          jumpVel=jumpVelMax;
        }
      }
    }

    if ((upPressed)) {
      jumpVel-=gravity;
      bearY-=jumpVel;

      if (bearY>bearY0) {
        upPressed =false;
        bearY=bearY0;
        jumpVel=0;
      }
    }
  }
  void display() {
    image(bear, bearX, bearY);
    //ellipse(bearX, bearY, 10, 10);
    if (bearX+posX<0) {
      over=true;
    }
    // println(bearX+posX);
  }
  void touchFood() {
    for (int i=0; i<food.size(); i++) {
      float x=food.get(i).x;
      float y=food.get(i).y;
      float dis=dist(x, y, bearX, bearY );
      if (dis<100) {
        food.remove(i);
        score++;
      }
    }
  }
}
