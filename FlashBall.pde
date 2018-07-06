class FlashBall {
  float angle = 0.0 ;
  float speed = 0.03 ;
  float FlashX  ;
  float FlashY  ;
  int BackR ;
  int BackG ;
  int BackB ;


  FlashBall(float FlashX_, float FlashY_, float angle_, float speed_, int BackR_, int BackG_, int BackB_) {
    FlashX = FlashX_ ;
    FlashY = FlashY_ ;
    angle = angle_ ;
    speed = speed_ ;
    BackR = BackR_ ;
    BackG = BackG_ ;
    BackB = BackB_ ;
  }

  void FlashDisplay() {
    fill(BackR, BackG, BackB, 80);
    rect(0, 0, width, height);
    circlePhase(0.0);
    circlePhase(QUARTER_PI);
    circlePhase(HALF_PI);
    angle += speed ;
  }
  void circlePhase(float phase) {
    float diameter = 65 + (sin(angle + phase) * 45 ) ;
    fill(255, 100);
    ellipse(1280-FlashX, 800 - FlashY, diameter, diameter);
  }
}
