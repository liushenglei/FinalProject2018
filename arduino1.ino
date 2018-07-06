#define potXPin  A1
#define potYPin  A0
char HEADER = 'M';
boolean ledState = false ;
void setup() {
  Serial.begin(9600);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(2, INPUT);
}
void loop()
{
  int x = analogRead(potXPin) / 4;              //读取摇杆X轴数据
  int y = analogRead(potYPin) / 4;              //读取摇杆Y轴数据
  Serial.print(HEADER);                       //输出数据帧头
  Serial.print(",");                          //逗号分隔符
  Serial.print(x, DEC);                       //X轴数据
  Serial.print(",");                          //逗号分隔符
  Serial.print(y, DEC);                       //Y轴数据
  Serial.print(",");           //逗号分隔符
  Serial.println();           //输出换行符作为帧尾
  analogWrite(9, x);           //摇杆控制RGB LED
  analogWrite(10, y);
  analogWrite(11, 100);
  delay(30);                                  //延时30ms
}

