default:
	avr-gcc -Os -DF_CPU=8000000UL -mmcu=atmega32u4 -c -o led.o led.c
	avr-gcc -o led.bin led.o
	avr-objcopy -O ihex -R .eeprom led.bin led.hex
	sudo avrdude -F -V -c arduino -p ATMEGA32U4 -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex
