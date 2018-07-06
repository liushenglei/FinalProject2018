import ddf.minim.*;
import processing.serial.*;
Serial myPort;
public static final char HEADER = 'M';                //数据帧头（起始位）
public static final short LF = 10;                    //数据帧尾（结束位）
public static final short portIndex = 2;
int i = 0 ;
int j = 0 ;
float x = 128 ;
float y = 129 ; 
float FlashX = random(100, 1100);
float FlashY = random(100, 700) ;
String[] Words ;
String[] Lines ;
Ball myBall ;
FlashBall flashBall ;
PVector ini = new PVector (640, 400);
PFont myFont ;
PFont secFont ;
PFont lineFont ;
AudioPlayer BGM ;
Minim minim ;

void setup() { 
  int BackR = 139 ;
  int BackG = 116 ;
  int BackB = 137 ;
  Words = new String[17];
  Words[0] = "Feel Bad ? Try to move the Ball" ;
  Words[1] = "And follow the Ball" ;
  Words[2] = "To feel the Peace"  ;
  Words[3] = "In your Heart" ;
  Words[4] = "Slow Down, Take Easy" ;
  Words[5] = "Music can cure everything in the World" ;
  Words[6] = "And Of Course , YOU " ;
  Words[7] = "NoMatterWhat cause you Disappointed" ;
  Words[8] = "I believe you can fix it" ; 
  Words[9] = "Just like What you've done before " ;
  Words[10] = "My favorite singer is LinkinPark" ;
  Words[11] = "And you ?" ;
  Words[12] = "Color is Power " ;
  Words[13] = "Color is Faith " ;
  Words[14] = "Color is Life" ;
  Words[15] = "May You Be Happy " ;
  Words[16] = "" ;
  Lines = new String[35] ;
  Lines[0] = "" ;
  Lines[1] = "" ;
  Lines[2] = "On and on" ;
  Lines[3] = "时间的行进" ;
  Lines[4] = "Over and over again" ;
  Lines[5] = "开启一幕幕的画面";
  Lines[6] = "There is no holding back time you said" ;
  Lines[7] = "你曾感叹时间难以琢磨" ;
  Lines[8] = "So you run your race ，made your transformation" ;
  Lines[9] = "所以你奋不顾身 记录人生的蜕变" ;
  Lines[10] = "and left your mark" ;
  Lines[11] = "留下存在的印记" ;
  Lines[12] = "The possibilities are always endless" ;
  Lines[13] = "人生对你来说 没有写好的剧本" ;
  Lines[14] = "Everyone of them is real" ;
  Lines[15] = "每个阶段的存在都是真实的" ;
  Lines[16] = "and everyone of them is still you" ;
  Lines[17] = "每个真实的片段组成了你" ;
  Lines[18] = "you will not stop until time fails" ;
  Lines[19] = "你坚决地向前走着" ;
  Lines[20] = "Let those memories never fade" ;
  Lines[21] = "回忆却安静的不曾离开" ;
  Lines[22] = "even if our eyes should go dim" ;
  Lines[23] = "即使双眼模糊了光影" ;
  Lines[24] = "For looking back ,even the ordinary has become an era lost or forgotten" ;
  Lines[25] = "平凡的珍贵 唤起不凡的人生" ;
  Lines[26] = "Only living and breathing" ;
  Lines[27] = "吐息间" ;
  Lines[28] = "On a shore" ;
  Lines[29] = "时光中" ;
  Lines[30] = "Where time has no hold" ;
  Lines[31] = "凝结片刻成为永恒" ;
  Lines[32] = "" ;
  Lines[33] = "" ;
  size(1280, 800);
  //noStroke();
  smooth();
  fill(255, 180);
  myFont = loadFont("FootlightMTLight-48.vlw") ;
  secFont = createFont("微软雅黑", 22);
  lineFont = loadFont("BellMTItalic-28.vlw");
  minim = new Minim(this);
  BGM = minim.loadFile("Rob Simonsen - Blue.mp3", 1024);
  BGM.play();
  flashBall = new FlashBall(FlashX, FlashY, 0.0, 0.05, BackR, BackG, BackB);
  myPort = new Serial(this, "COM3", 9600);
  myPort.clear();
  while (Math.abs(640- flashBall.FlashX) < 30 && Math.abs(400 - flashBall.FlashY)< 30) {
    flashBall.FlashX =random(100, 1100);
    flashBall.FlashY= random(100, 700);
  }
}

void MoveBall() {                                //主球碰到辅球时辅球移位
  if (Math.abs(myBall.loc.x- flashBall.FlashX) < 30 && Math.abs(myBall.loc.y - flashBall.FlashY)< 30) {
    flashBall.FlashX =random(100, 1100);
    flashBall.FlashY= random(100, 700);
    MoveBall();
  }
}

void ChangeColor() {                              //主球碰到辅球时背景颜色改变
  if (Math.abs(myBall.loc.x- flashBall.FlashX) < 30 && Math.abs(myBall.loc.y - flashBall.FlashY)< 30) {
    flashBall.BackR += 11.6 ;
    flashBall.BackG += 5.8 ;
    flashBall.BackB += 4.8 ;
  }
  if (flashBall.BackR > 293 && flashBall.BackG > 186 && flashBall.BackB > 193) {
    flashBall.BackR = 293 ;
    flashBall.BackG = 186 ;
    flashBall.BackB = 193 ;
  }
}

void ChangeWord() {                               //第一段字幕
  fill(#EEE8AA);
  textFont(myFont);
  text(Words[i], 200, 215);
  if (Math.abs(myBall.loc.x- flashBall.FlashX) < 30 && Math.abs(myBall.loc.y - flashBall.FlashY)< 30) {
    i ++ ;
    if (i>16) {
      i = 16 ;
    }
  }
}

void SecWord() {                               // 第二段字幕
  if (i == 16) {
    fill(#FF6347,100);
    textAlign(CENTER);
    textFont(lineFont);
    text(Lines[j], width/2, 700);
    textFont(secFont);
    text(Lines[j+1], width/2, 740);
    if (Math.abs(myBall.loc.x- flashBall.FlashX) < 30 && Math.abs(myBall.loc.y - flashBall.FlashY)< 30) {
      j += 2 ;
      if (j>32) {
        j = 32 ;
      }
    }
  }
}

void LimitField() {                           //限制主球区域
  if (myBall.loc.x > 1250 ) {
    myBall.loc.x = 1250 ;
  }
  if (myBall.loc.x < 30 ) {
    myBall.loc.x = 30 ;
  }
  if (myBall.loc.y > 770 ) {
    myBall.loc.y = 770 ;
  }
  if (myBall.loc.y < 30 ) {
    myBall.loc.y = 30 ;
  }
}

void MusicWave(){
 for(int i = 0; i < BGM.left.size()-1; i ++){
  strokeWeight(abs(BGM.left.get(i)*20));
  line(i, 150 + BGM.left.get(i)*50,i+1, 150 + BGM.left.get(i+1)*50);
  line(i, 250 + BGM.right.get(i)*50,i+1, 250 + BGM.right.get(i+1)*50);
 }
}

void draw() {
  noStroke();
  PVector vec = new PVector(x/14-128/14-0.14285755, y/14-128/14-0.21428585);
  myBall = new Ball(ini, vec);
  myBall.BallGo();
  flashBall.FlashDisplay();
  myBall.Display();
  LimitField();
  ChangeColor();
  ChangeWord();
  SecWord();
  MoveBall();
  stroke(255);
  MusicWave();
}

void serialEvent(Serial myPort) {
  String  message = myPort.readStringUntil(LF);  //返回一个字符串缓冲区，并包括一个特殊字符
  if (message != null) {
    String []data = message.split(",");          //返回带有特殊字符的字符串
    if (data[0].charAt(0) == HEADER)             //读取到帧头
    {
      if (data.length > 2)
      {
        x = Integer.parseInt(data[1]);           //把整型对象转换成基本数据类型int
        y = Integer.parseInt(data[2]);
      }
    }
  }
}
