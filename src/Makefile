default:
	avr-gcc -Os -DF_CPU=8000000UL -mmcu=atmega32u4 -c -o led.o led.c
	avr-gcc -o led.bin led.o
	avr-objcopy -O ihex -R .eeprom led.bin led.hex
	avrdude -F -V -c avr109 -p atmega32u4 -P /dev/ttyACM0 -b 57600 -U flash:w:led.hex
