upload: build/led.hex build/venv
	. ./build/venv/bin/activate
	./build/venv/bin/python3 src/reset.py /dev/ttyACM0
	while :; do sleep 0.5; [ -c "/dev/ttyACM0" ] && break; done
	avrdude -F -V -c avr109 -p atmega32u4 -P /dev/ttyACM0 -b 57600 -U flash:w:build/led.hex

build/venv: requirements.txt
	python3 -m venv build/venv
	. ./build/venv/bin/activate
	./build/venv/bin/pip install -r requirements.txt

build/led.o: src/led.c
	avr-gcc -Os -DF_CPU=8000000UL -mmcu=atmega32u4 -c -o build/led.o src/led.c

build/led.bin: build/led.o
	avr-gcc -o build/led.bin build/led.o

build/led.hex: build/led.bin
	avr-objcopy -O ihex -R .eeprom build/led.bin build/led.hex

build/venv build/lex.hex build/led.bin build/led.o: | build

build:
	mkdir build

clean:
	rm -rf build
	rm -rf venv
