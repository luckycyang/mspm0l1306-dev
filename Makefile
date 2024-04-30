build:
	cmake -Bbuild -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.cmake
	ninja -C build

clean:
	rm -rf build
