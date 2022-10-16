upload: led.hex venv
	. ./venv/bin/activate
	./venv/bin/python3 reset.py /dev/ttyACM0
	while :; do sleep 0.5 [ -c "/dev/ttyACM0" ] && break; done
	avrdude -F -V -c avr109 -p atmega32u4 -P /dev/ttyACM0 -b 57600 -U flash:w:led.hex

venv: requirements.txt
	python3 -m venv venv
	. ./venv/bin/activate
	./venv/bin/pip install -r requirements.txt

led.o: led.c
	avr-gcc -Os -DF_CPU=8000000UL -mmcu=atmega32u4 -c -o led.o led.c

led.bin: led.o
	avr-gcc -o led.bin led.o

led.hex: led.bin
	avr-objcopy -O ihex -R .eeprom led.bin led.hex
