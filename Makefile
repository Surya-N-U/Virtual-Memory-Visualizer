CC = gcc
CFLAGS = -Wall -Wextra -Iinclude

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

# Get all .c files in src directory
SRCS := $(wildcard $(SRC_DIR)/*.c)

# Generate corresponding object file names
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Get all .h files in include directory
HEADERS := $(wildcard $(INCLUDE_DIR)/*.h)

# The final binary name
TARGET = memory-visulaizer

# Main target, it depends on the final binary
all: $(BUILD_DIR)/$(TARGET)

# Rule to build the final binary
$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# Rule to compile .c files to .o files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up the build directory
clean:
	rm -rf $(BUILD_DIR)

# Make sure build directory exists before compiling
$(shell mkdir -p $(BUILD_DIR))

.PHONY: all clean

