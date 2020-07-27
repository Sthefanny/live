#include <Keyboard.h>

int delaytime = 250;

void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP); //Audio Switch
  pinMode(3, INPUT_PULLUP); //Camera Switch
  pinMode(4, INPUT_PULLUP); //Scene 3
  pinMode(5, INPUT_PULLUP); //Scene 2
  pinMode(6, INPUT_PULLUP); //Scene 1

}

void loop() {
  // put your main code here, to run repeatedly:
  int button2 = digitalRead(2);
  int button3 = digitalRead(3);
  int button4 = digitalRead(4);
  int button5 = digitalRead(5);
  int button6 = digitalRead(6);


//Audio Switch
if (button2 == LOW)
{
  Keyboard.press(128);
  Keyboard.press(129);
  Keyboard.press(194);
  delay(delaytime);
  Keyboard.releaseAll();
}

//Camera Switch
if (button3 == LOW)
{
  Keyboard.press(128);
  Keyboard.press(129);
  Keyboard.press(195);
  delay(delaytime);
  Keyboard.releaseAll();
}

//Scene 3
if (button4 == LOW)
{
  Keyboard.press(128);
  Keyboard.press(129);
  Keyboard.press(196);
  delay(delaytime);
  Keyboard.releaseAll();
}

//Scene 2
if (button5 == LOW)
{
  Keyboard.press(128);
  Keyboard.press(129);
  Keyboard.press(197);
  delay(delaytime);
  Keyboard.releaseAll();
}

//Scene 1
if (button6 == LOW)
{
  Keyboard.press(128);
  Keyboard.press(129);
  Keyboard.press(198);
  delay(delaytime);
  Keyboard.releaseAll();
}

}
