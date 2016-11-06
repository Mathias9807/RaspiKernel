KERNEL=build/kernel.img
ELF=build/kernel.elf

CC=arm-none-eabi-gcc

INCLUDE_DIRS=-I./src/
SOURCE_FILES=src/kernel.c build/boot.o

LINKER=-T src/linker.ld

ADD_PARAMS=-nostartfiles -nostdlib -ffreestanding -Wall \
	   	-march=armv6 -mfpu=neon-vfpv4 -O3

ASM=build/kernel.S

C_SRC=src/kernel.c

# Assumes Raspberry pi 2
all: 
	$(CC) -o $(ASM) $(C_SRC) $(INCLUDE_DIRS) $(ADD_PARAMS) -S -std=c99 -DBCM2836
	$(CC) -o $(ELF) $(SOURCE_FILES) $(LINKER) $(INCLUDE_DIRS) $(ADD_PARAMS) -DBCM2836
	arm-none-eabi-objcopy $(ELF) -O binary $(KERNEL)

bcm2835: 
	$(CC) -o $(ASM) $(C_SRC) $(INCLUDE_DIRS) $(ADD_PARAMS) -S -std=c99 -DBCM2835
	$(CC) -o $(ELF) $(SOURCE_FILES) $(LINKER) $(INCLUDE_DIRS) $(ADD_PARAMS) -DBCM2835
	arm-none-eabi-objcopy $(ELF) -O binary $(KERNEL)

