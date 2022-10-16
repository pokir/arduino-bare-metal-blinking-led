# Notes

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
