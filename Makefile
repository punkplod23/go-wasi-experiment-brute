GOCMD   =  go
GOBUILD =  $(GOCMD)  build
GORUN = $(GOCMD) run
TINYGOCMD   =  tinygo
TINYGOBUILD = $(TINYGOCMD) build



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