# Здравствуйте!

```cpp
#define pinLED 12
#define pinBtn 10

void setup() {
  pinMode(pinLED, OUTPUT);
  pinMode(pinBtn, INPUT_PULLUP);
}

void loop() {
  const auto btnState = !digitalRead(pinBtn);
  digitalWrite(pinLED, btnState);
}
```
