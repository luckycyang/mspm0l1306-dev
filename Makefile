build:
	arm-none-eabi-gcc -o app src/main.c startup/startup_mspm0l130x_gcc.c startup/priv.c -T ./startup/mspm0l1306.lds -mcpu=cortex-m0plus -mthumb -nostdlib
	arm-none-eabi-objcopy -O ihex app app.hex
	arm-none-eabi-objcopy -O binary -S app app.bin


clean:
	rm -rf app*
