CC = gcc
ASM = nasm

CFLAGS = -I src/headers
ASMFLAGS = -f elf64

SRC_DIR = src
BUILD_DIR = build

C_SRC = $(SRC_DIR)/main.c
ASM_SRC = $(SRC_DIR)/slprint.asm

C_OBJ = $(BUILD_DIR)/main.o
ASM_OBJ = $(BUILD_DIR)/slprint.o

TARGET = silicon

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(C_OBJ) $(ASM_OBJ)
	$(CC) $(C_OBJ) $(ASM_OBJ) -o $(TARGET)

$(C_OBJ): $(C_SRC) $(SRC_DIR)/headers/silicon.h
	$(CC) $(CFLAGS) -c $(C_SRC) -o $(C_OBJ)

$(ASM_OBJ): $(ASM_SRC)
	$(ASM) $(ASMFLAGS) $(ASM_SRC) -o $(ASM_OBJ)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: all clean
