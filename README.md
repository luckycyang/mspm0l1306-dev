# mspm0l1306-dev

The cmake dev for mspm0l1306

## 简易使用

**环境配置**

`NixOS` 或使用 `Nix` 包管理器

```Nix
nix develop
```

其他发行版安装 `ninja` `cmake` `make` `GNU Arm Embedded Toolchain` 即可

**编译**

```Bash
make
```

文件存在 `build/app.bin`

## Features

- [x] 编译通过
- [x] 引入标准寄存器
      ....

**注意当前默认Debug编译**

并不推荐开启较高优化， 开启较高优化后 `startup_mspm0l130x_gcc.c` 中 `Reset_Handler` 函数中将代码转移 SRAM 和将 bss 段初始化会被优化成 `memcpy` 和 `memset`， 导致编译错误

编译通过， 但是 `clangd` 抽风, 可能找不到 `stdint.h` 等自带库， 实际在编译的时候是认得自己的库, 解决办法就是添加 `gcc` 默认 `include` 到 `CMakeLists.txt`, `NixOS` 不符合 `FHS` 标准， 所以懒得弄
