import oscP5.*;
import netP5.*;

OscP5 oscP5;

float azimuth = 0;
float pitch = 0;
float roll = 0;

void setup() {
  size(500, 500);
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  
  oscP5 = new OscP5(this, 8000);
  
  println("Esperando datos OSC en puerto 8000...");
  println("Asegúrate de que tu celular y PC estén en la misma red.");
}

void draw() {
  background(0);
  
  // Mover un círculo según los datos del giroscopio
  float x = map(roll, -180, 180, 0, width);
  float y = map(pitch, -90, 90, 0, height);
  
  ellipse(x, y, 50, 50);
  
  text("azimuth: " + nf(azimuth, 1, 2), width/2, height - 60);
  text("pitch: "   + nf(pitch, 1, 2),   width/2, height - 40);
  text("roll: "    + nf(roll, 1, 2),    width/2, height - 20);
}

void oscEvent(OscMessage msg) {
  String addr = msg.addrPattern();
  
  if (addr.equals("/orientation") || addr.equals("/rotation_vector") || addr.equals("/gyro")) {
   
    if (msg.typetag().length() >= 3) {
      azimuth = msg.get(0).floatValue();
      pitch   = msg.get(1).floatValue();
      roll    = msg.get(2).floatValue();
      
      println("Datos:", azimuth, pitch, roll);
    }
  }
}
