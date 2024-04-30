all: build

binit:
	cmake -Bbuild -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.cmake -GNinja

build: binit
	ninja -C build

clean:
	rm -rf build
