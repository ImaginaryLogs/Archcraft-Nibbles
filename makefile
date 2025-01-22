# Define the Rust compiler
CARGO := cargo

# Directories
ASM_DIR := assembler
SRC_DIR := ./src
MAIN_FILE := $(SRC_DIR)/main.rs
BUILD_DIR := ./target

# Targets
.PHONY: all build run clean

# Default target
all: build

# Build the Rust file
build:
	@echo "Building assembler executable...";
	cd ./$(ASM_DIR); $(CARGO) run --package assembler --bin assembler;

run:
	cd ./$(ASM_DIR); $(CARGO) run --manifest-path Cargo.toml

# Clean the build directory
clean:
	@echo "Cleaning build artifacts...";
	cd ./$(ASM_DIR); rm -rf $(BUILD_DIR);