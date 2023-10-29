import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float boton = 0; // Inicializamos el valor de boton a 0
PImage foto1, foto2;
int estado = 0;
boolean pasarPantalla = false;
int tiempoInicio = 0; // Nuevo temporizador
boolean botonPresionado = false; // Variable para almacenar el tiempo actual

void setup() {
  size(1800, 900);
  background(0);
  textAlign(CENTER);
  textSize(20);
  foto1 = loadImage("intro2.png");
  foto2 = loadImage("intro222.png");

  oscP5 = new OscP5(this, 9000);
  myRemoteLocation = new NetAddress("192.168.0.209", 12000);

}

void draw() {
  background(0);

  if (boton == 1.2 && !botonPresionado) {
    pasarPantalla = true;
    botonPresionado = true; // Marca el botón como presionado
    tiempoInicio = millis(); // Guarda el tiempo actual
  }

  switch (estado) {
    case 0:
      image(foto1, 0, 0);
      text(boton, width/2, height/2);
      if (pasarPantalla && millis() - tiempoInicio > 2000) {
        estado = 1;
        pasarPantalla = false;
        tiempoInicio = millis();
        boton = 0; // Establecemos el valor de boton a 0
      }
      break;

    case 1:
      text(boton, 199-width/2, height/2);
      image(foto2, 0, 0);
      if (pasarPantalla && millis() - tiempoInicio > 2000) {
        estado = 0;
        pasarPantalla = false;
        tiempoInicio = millis();
        boton = 0; // Establecemos el valor de boton a 0
      }
      break;
  }
}


void oscEvent(OscMessage m) {
  print("### received an osc message.");
  print(" addrpattern: " + m.addrPattern());
  println(" typetag: " + m.typetag());

  if (m.addrPattern().equals("/mensaje1")) {
    boton = m.get(0).floatValue();
    if (boton == 0) {
      botonPresionado = false; // Reinicia la variable al recibir el mensaje 0
    }
    pasarPantalla = true;
    println("mensaje 1 sirve");
  }
}
