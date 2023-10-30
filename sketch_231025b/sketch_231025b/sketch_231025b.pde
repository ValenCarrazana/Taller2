/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

String dosValores = "0";

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("192.168.0.209",9000);
}


void draw() {
  
  background(0);  
  
}


 void boton(){

    
 }

void touchStarted(){
//  /* send the message */
   OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/0" );
   myMessage1.add( 2.0 );
   oscP5.send(myMessage1, myRemoteLocation);
}

void touchIsMoving(){
//  /* send the message */
   OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/0" );
   myMessage1.add( 2.0 );
   oscP5.send(myMessage1, myRemoteLocation);
}

void touchEnded(){

  OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/1" );
  myMessage1.add( 1.0 );
  oscP5.send(myMessage1, myRemoteLocation);
  
}

//void mousePressed() {
//  /* in the following different ways of creating osc messages are shown by example */
//  OscMessage myMessage = new OscMessage("/test");
//  OscMessage myMessage1 = new OscMessage("/mensaje1");
  
//  myMessage.add(123); /* add an int to the osc message */
//  myMessage1.add(1.2);
//  /* send the message */
//  oscP5.send(myMessage, myRemoteLocation); 
//  oscP5.send(myMessage1, myRemoteLocation); 
//  println( "presionado" );
//}

//void mouseReleased(){
//  OscMessage myMessage1 = new OscMessage("/mensaje1");
//  myMessage1.add(1.1);
//  oscP5.send(myMessage1, myRemoteLocation); 
//}
