# arduino-bare-metal-blinking-led

Make the red LED on the Circuit Playground blink without using the Arduino IDE.

This repository follows [this video](https://www.youtube.com/watch?v=j4xw8QomkXs), but using an Adafruit Circuit Playground instead of an Arduino UNO.

## Requirements

```sh
sudo apt-get install avr-libc avrdude binutils-avr gcc-avr
```

## Circuit Playground Documentation

Useful parts for this project of the Circuit Playground documentation and ATMEGA32u4 microcontroller datasheet are in the `./circuit-playground-documentation` folder.

## Uploading to Circuit Playground

```sh
make
```

## Cleaning

Clean the files after building/uploading:

```sh
make clean
```
