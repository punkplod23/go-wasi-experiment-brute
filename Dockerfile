FROM archlinux/archlinux

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm wasmtime

RUN ln -s /usr/local/bin/wasmtime /usr/local/bin/wasmtime # Example path, MUST VERIFY

COPY ./main.wasm /main.wasm

ENTRYPOINT ["wasmtime", "/main.wasm"]
CMD ["MD5", "098f6bcd4621d373cade4e832627b4f6", "100000", "4"]