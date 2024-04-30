all: build

build:
	cmake -Bbuild -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.cmake -GNinja
	ninja -C build

clean:
	rm -rf build
