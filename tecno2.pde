

import processing.serial.*;
import java.awt.Robot;
import java.awt.event.KeyEvent;

Serial miPuerto;
Robot robot;

void setup() {

  printArray(Serial.list());
  

  miPuerto = new Serial(this, Serial.list()[0], 9600);
  
  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
  if (miPuerto.available() > 0) {
    String valor = miPuerto.readStringUntil('\n');
    if (valor != null) {
      valor = trim(valor);
      println("Recibido: " + valor);
      
      if (valor.equals("1")) {
        // Simula tecla C
        robot.keyPress(KeyEvent.VK_C);
        robot.keyRelease(KeyEvent.VK_C);
        println("Tecla C presionada");
      }
    }
  }
}
