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

`NixOS` 会抽风, 因为非 `FHS`, `clangd` 可能会报没有头文件错, 我在 `Arch` 上没报错。

## 简易使用

[**使用SDK和SYSCONFIG快速生成配置**](https://github.com/luckycyang/notes/blob/main/mspm0l1306%20with%20sdk%26sysconfig.md)
