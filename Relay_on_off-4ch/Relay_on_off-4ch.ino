void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
 for (int i=9; i <= 12; i++){
pinMode(i, 1);
}
}
void loop() 
{
while(!Serial.available()); //시리얼로 데이터 들어올 때까지 대기
char com = Serial.read(); //들어온 데이터를 변수 com에 저장
Serial.print(com);
switch(com) {
   case 'q':
   digitalWrite(9, 1) ; 
   delay(100);
   break;
   case 'a':
   digitalWrite(9, 0) ; 
   delay(100);
   break;
   case 'w':
   digitalWrite(10, 1) ; 
   delay(100);
   break;
   case 's':
   digitalWrite(10, 0) ; 
   delay(100);
   break;
   case 'e':
   digitalWrite(11, 1) ; 
   delay(100);
   break;
   case 'd':
   digitalWrite(11, 0) ; 
   delay(100);
   break;
   case 'r':
   digitalWrite(12, 1) ; 
   delay(100);
   break;
   case 'f':
   digitalWrite(12, 0) ; 
   delay(100);
   break;
}
}


