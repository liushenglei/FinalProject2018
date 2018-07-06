class Ball {
  PVector loc ;
  PVector speed ;
 
  Ball(PVector loc_ , PVector speed_){
  loc = loc_ ;
  speed = speed_ ;
  }

  void Display() {
    fill(255, 48, 48);
    noStroke();
    ellipse(1280-loc.x, 800-loc.y, 60, 60);
  }
  
  void BallGo(){
    loc.add(speed);
  }
}
