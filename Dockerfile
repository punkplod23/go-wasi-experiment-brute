FROM wasm3/wasm3:latest
COPY ./main.wasm /main.wasm
ENTRYPOINT [ "wasm3", "/main.wasm" ]