# Notes

Notes made while writing the code.

## Ports

The red LED on the Circuit Playground is pin D13.

Port C7 on the ATMEGA32u4 microcontroller is the reigster mapped to the D13 LED on the Circuit Playground.

PC7 is bit number 7 (0 indexed) of port.

To set PC7 as an output bit, DDC7 (Port C Data Direction Register) needs to be 1.

So the goal is to have these two registers set as:

| &nbsp; | &nbsp; |
| :-: | :-: |
| PORTC | 1000000 |
| DDC7 | 1000000 |

## Setting bits on registers

To set bit `n` of a register:
`reg = reg | (1 << n``

To unset bit `n` of a register:
`reg = reg & ~(1 << n)`

## Resetting the Circuit Playground automatically

The Circuit Playground needs to be reset (put into bootloader mode) before being able to upload code to it.

This is how it is done in the [arduino source code](https://github.com/arduino/arduino-cli/blob/7415e269061ff4d90e6356f6c1156941122d58c3/arduino/serialutils/serialutils.go#L30-L56).

The serial port has to be opened with 1200 baud, dtr has to be turned off and the port has to be closed for the board to reset (bootloader mode).

## `avr-gcc` and `avrdude`

`avr-gcc` compiles the code for the ATMEGA32u4 microcontroller.

`avrdude` uploads the code to the microcontroller.
It needs to use the `-c avr109` and `-b 57600` options.
