int led = 9;           // the PWM pin the LED is attached to
int brightness = 0;    // how bright the LED is
int fadeAmount = 10;    // how many points to fade the LED by



void setup() {
  Serial.begin(1200);
  pinMode( 8, OUTPUT);
  pinMode ( 9, OUTPUT);
  
}


void loop() {
  // read the input on analog pin 0:
  // ligth SensorState
  int sensorValue = analogRead(A0);
  float voltage = sensorValue * (5.0 / 1023.0);
  // print out the value you read:
  Serial.println(voltage);
  // analog for the second LED
  analogWrite(led, brightness);
  int switchState = digitalRead (A4);
  //first LED
  if (voltage < 3) {
    brightness += fadeAmount;
  } else {
    brightness = 0;
  }
  if (brightness <= 0 || brightness >= 255)
    fadeAmount = -fadeAmount;

  // second LED
  if (voltage < 3) {
    digitalWrite ( 8, HIGH);
  } else {
    digitalWrite( 8, LOW);
  }
  //if switch is pressed
  if (switchState == HIGH) {
   //second LED
    brightness = 255;
   //first LED
    digitalWrite(8, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(500);                       // wait for a second
    digitalWrite(8, LOW);    // turn the LED off by making the voltage LOW
    delay(500);                       // wait for a second
  }


}
