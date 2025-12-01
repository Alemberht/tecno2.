// Arduino UNO: Enviar señal a Processing cuando se presiona un botón

const int botonPin = 2;  // Pin del botón
int estadoBoton = 0;

void setup() {
  pinMode(botonPin, INPUT_PULLUP);  // Usa resistencia interna
  Serial.begin(9600);
}

void loop() {
  estadoBoton = digitalRead(botonPin);
  
  if (estadoBoton == LOW) { // Botón presionado (conexión a GND)
    Serial.println("1");
    delay(200);  // Pequeño retardo para evitar rebotes
  }
}