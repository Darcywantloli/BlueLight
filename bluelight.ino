#include <SoftwareSerial.h>
SoftwareSerial HM10(2, 3);
const byte Cds = A0;
void setup() {
  Serial.begin(9600);
  HM10.begin(9600); 
}

void loop() {
  HM10.listen();
  int val;
  val = analogRead(Cds);
  Serial.println(val / 10 + 20);
  Serial.write(val / 10 + 20);
  Serial.println("done!");
  HM10.write(val / 10 + 20);
  delay(1000);
}
