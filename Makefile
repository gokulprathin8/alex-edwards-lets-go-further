# Makefile for Go APIs using net/http

# Define variables
APP_NAME = alex-edwards-lets-go-further
BUILD_DIR = ./bin
SRC_DIR = ./cmd/api

.PHONY: all
all: build

dev:
	@air

build:
	@echo "Building the application..."
	@go build -o $(BUILD_DIR)/$(APP_NAME) $(SRC_DIR)

run: build
	@echo "Running the application..."
	@$(BUILD_DIR)/$(APP_NAME)

clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)

deps:
	@echo "Installing dependencies..."
	@go mod tidy

test:
	@echo "Running tests..."
	@go test ./...

lint:
	@golangci-lint run

format:
	@goimports -w $(SRC_DIR)

coverage:
	@go test -coverprofile=coverage.out ./...
	@go tool cover -html=coverage.out
