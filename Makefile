GOCMD   =  go
GOBUILD =  $(GOCMD)  build
GORUN = $(GOCMD) run
TINYGOCMD   =  tinygo
TINYGOBUILD = $(TINYGOCMD) build

WASM_RUNTIME_VERSION = 14.0.4 # Replace with the desired Wasmtime version
WASM_RUNTIME_URL = https://github.com/bytecodealliance/wasmtime/releases/download/v$(WASM_RUNTIME_VERSION)/wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-linux.tar.gz
WASM_RUNTIME_TAR = wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-linux.tar.gz
WASM_RUNTIME_DIR = wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-linux

WASM_RUNTIME_URL_WINDOWS = https://github.com/bytecodealliance/wasmtime/releases/download/v$(WASM_RUNTIME_VERSION)/wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-windows.zip
WASM_RUNTIME_ZIP_WINDOWS = wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-windows.zip
WASM_RUNTIME_DIR_WINDOWS = wasmtime-v$(WASM_RUNTIME_VERSION)-x86_64-windows


compile-wasm:export GOOS=wasip1
compile-wasm:export GOARCH=wasm
compile-wasm:
	$(GOBUILD) -o main.wasm
compile-wasm:
	$(GOBUILD) -o main.wasm
test:
	wasmtime main.wasm MD2 8df4c057f9b7de9d6bd9b0ca3b795734 100000 9

# Clean command
clean:
	rm -f $(OUT)

.PHONY: build clean

docker-build:
	docker build -t gwythe/main-wasm:0.1 .

docker-run:
	docker run gwythe/main-wasm:0.1

download-wasmtime:
    wget $(WASM_RUNTIME_URL)
    tar -xzf $(WASM_RUNTIME_TAR)
    sudo cp $(WASM_RUNTIME_DIR)/wasmtime /usr/local/bin # Or another directory in your PATH
    rm $(WASM_RUNTIME_TAR)
    rm -rf $(WASM_RUNTIME_DIR)

download-wasmtime-windows:
    curl -L $(WASM_RUNTIME_URL_WINDOWS) -o $(WASM_RUNTIME_ZIP_WINDOWS)
    powershell Expand-Archive -Path $(WASM_RUNTIME_ZIP_WINDOWS) -DestinationPath .
    #copy the wasmtime.exe
    Copy-Item $(WASM_RUNTIME_DIR_WINDOWS)/wasmtime.exe C:\Windows\System32
    del $(WASM_RUNTIME_ZIP_WINDOWS)
    Remove-Item -Recurse -Force $(WASM_RUNTIME_DIR_WINDOWS)
