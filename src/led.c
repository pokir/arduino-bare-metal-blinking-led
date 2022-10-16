#include <avr/io.h>
#include <util/delay.h>

int main(void) {
  // set PORTC7 as an output
  DDRC = DDRC | (1 << DDC7);

  // forever...
  while (true) {
    // set PORTC7
    PORTC = PORTC | (1 << PORTC7);

    // wait
    _delay_ms(1000);

    // unset PORTC7
    PORTC = PORTC & ~(1 << PORTC7);

    // wait
    _delay_ms(1000);
  }
}
