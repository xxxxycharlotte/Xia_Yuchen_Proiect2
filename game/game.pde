PImage[] barrier;
PImage back, back1;
PImage tree;
PImage bear, honey;
float posX=0;
float velX=-5;
Bear mybear;
ArrayList<Barrier> barriers;
ArrayList<Food> food;
int time=0;
int score=0;
boolean over=false;
void setup() {
  size(1200, 600);
  barrier=new PImage[2];
  barrier[0]=loadImage("barrier1.png");
  barrier[1]=loadImage("barrier2.png");
  barrier[0].resize(583, 100);
  barrier[1].resize(333, 100);
  back=loadImage("background0.png");
  back1=loadImage("background00.png");
  tree=loadImage("background2.png");
  honey=loadImage("honey.png");
  honey.resize(80, 80);
  back.resize(2400, 500);
  back1.resize(1200, 500);
  tree.resize(width, height);
  bear=loadImage("bear.png");
  bear.resize(1264/6, 1469/6);
  mybear=new Bear();
  barriers=new ArrayList<Barrier>();
  food=new ArrayList<Food>();
  imageMode(CENTER);
  frameRate(60);
}

void draw() {
  background(167, 220, 224);
  translate(posX, 0);
  posX+=velX;
  updateBack();
  float mytime=frameCount/100;
  if (mytime>time) {
    //println(frameCount/100);
    float px=random(width-posX, 2*width-posX);
    float py= height/2+random(50, 150);
    barriers.add(new Barrier(px, py));
    food.add(new Food(px, py-80));
    time=frameCount/100;
  }

  for (int i=0; i<barriers.size(); i++) {
    if (!over) {
      barriers.get(i).update();
    }
    barriers.get(i).display();
    barriers.get(i).touchBarrier();
  }
  for (int i=0; i<food.size(); i++) {
    if (!over) {
      food.get(i).update();
    }
    food.get(i).display();
  }
  mybear.updateBear();
  mybear.display();
  mybear.touchFood();
  //mybear.touchBarrier();
  textSize(30);
  fill(0);
  text("SCORE: "+score, 30-posX, 50);
  if (over) {
    fill(255, 0, 0);
    textSize(100);
    text("GAME OVER", width/4-posX, height/2);
  }
}
void updateBack() {
  int mytime=int(posX/width);
  int mytime2=int(posX/width);
  image(tree, width*(abs(mytime)), height/2+100);
  image(tree, width*(abs(mytime)+1), height/2+100);
  image(tree, width*(abs(mytime)+2), height/2+100);
  image(back1, width*(abs(mytime2)+2)-200, height/2+50);
  image(back1, width*(abs(mytime2))-200, height/2+50);
  image(back1, width*(abs(mytime2)+1)-200, height/2+50);
  image(back, width*(abs(mytime2)+2), height/2+100);
  image(back, width*(abs(mytime2)), height/2+100);
  image(back, width*(abs(mytime2)+1), height/2+100);
}
