# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -g -I./include
CXXFLAGS = -Wall -Wextra -g -I./include
LDFLAGS =

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
BIN_DIR = bin

# Source files
C_SOURCES = $(wildcard $(SRC_DIR)/*.c) $(wildcard *.c)
CPP_SOURCES = $(wildcard *.cpp)
C_OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.c)) \
            $(patsubst %.c,$(BUILD_DIR)/%.o,$(wildcard *.c))
CPP_OBJECTS = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(CPP_SOURCES))
OBJECTS = $(C_OBJECTS) $(CPP_OBJECTS)

# Target executable
TARGET = $(BIN_DIR)/program

# Default target
all: directories $(TARGET)

# Create necessary directories
directories:
	@mkdir -p $(BUILD_DIR) $(BIN_DIR)

# Link C and C++ objects to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

# Compile C source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile C files from root directory (main.c)
$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile C++ source files (main.cpp)
$(BUILD_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Run the program
run: all
	./$(TARGET)

# Debug target
debug: CFLAGS += -DDEBUG -O0
debug: CXXFLAGS += -DDEBUG -O0
debug: all

# Release target with optimizations
release: CFLAGS = -Wall -O2 -I./include
release: CXXFLAGS = -Wall -O2 -I./include
release: clean all

# Include dependency files if they exist
-include $(OBJECTS:.o=.d)

# Generate dependency files
$(BUILD_DIR)/%.d: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	@$(CC) $(CFLAGS) -MM $< -MT $(@:.d=.o) > $@

$(BUILD_DIR)/%.d: %.cpp
	@mkdir -p $(BUILD_DIR)
	@$(CXX) $(CXXFLAGS) -MM $< -MT $(@:.d=.o) > $@

.PHONY: all clean run debug release directories
