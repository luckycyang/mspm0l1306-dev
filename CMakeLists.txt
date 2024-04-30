cmake_minimum_required(VERSION 3.5)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(app C ASM)

# 启用命令输出，Vim/NeoVim 安装 LSP 时， LSP 可以正常工作:w
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# 源文件
file(GLOB_RECURSE C_SOURCES ./src/*.c ./startup/*.c)

# 汇编源文件 file( GLOB ASM_SOURCES <file here> )

# 添加头文件目录
include_directories(include include/third_party/CMSIS/Core/Include)

add_executable(${PROJECT_NAME})

target_link_directories(${PROJECT_NAME} PRIVATE)

target_link_libraries(${PROJECT_NAME} PRIVATE # c m nosys
)

target_compile_definitions(${PROJECT_NAME} PRIVATE DeviceFamily_MSPM0L130X)

target_compile_options(${PROJECT_NAME} PRIVATE -mcpu=cortex-m0plus -lnostd)

target_link_options(${PROJECT_NAME} PRIVATE -T
                    ${PROJECT_SOURCE_DIR}/startup/mspm0l1306.lds -nostdlib)
target_sources(${PROJECT_NAME} PRIVATE ${C_SOURCES} ${ASM_SOURCES})

add_custom_command(
  TARGET ${PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${PROJECT_NAME}>)

add_custom_command(
  TARGET ${PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${PROJECT_NAME}>
          ${PROJECT_NAME}.hex)

add_custom_command(
  TARGET ${PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${PROJECT_NAME}>
          ${PROJECT_NAME}.bin)
