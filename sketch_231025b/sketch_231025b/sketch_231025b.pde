import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
int lastPressTime = 0;
boolean isPressed = false;

void setup() {
  size(400, 400);
  frameRate(25);
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("192.168.0.209", 9000);
}

void draw() {
  background(0);
}

void mousePressed() {
  if (!isPressed) {
    OscMessage myMessage = new OscMessage("/test");
    OscMessage myMessage1 = new OscMessage("/mensaje1");

    myMessage.add(123);
    myMessage1.add(1.2);

    oscP5.send(myMessage, myRemoteLocation);
    oscP5.send(myMessage1, myRemoteLocation);

    lastPressTime = millis(); // Guardar el tiempo del último clic
    isPressed = true;
  }
}

void mouseReleased() {
  OscMessage myMessage1 = new OscMessage("/mensaje1");
  myMessage1.add(0);
  oscP5.send(myMessage1, myRemoteLocation);
  isPressed = false;
}

void checkTime() {
  int currentTime = millis();
  if (isPressed && currentTime - lastPressTime > 2000) {
    OscMessage myMessage1 = new OscMessage("/mensaje1");
    myMessage1.add(0);
    oscP5.send(myMessage1, myRemoteLocation);
    lastPressTime = currentTime;
  }
}
