#!/usr/bin/env bash

NEWLIB_SRC_DIR=$1

export CC_FOR_TARGET=riscv32-unknown-elf-clang
export CFLAGS_FOR_TARGET=" \
  -g -Os \
  -fepic \
  -fuse-ld=ld.lld \
  --gcc-toolchain=$(dirname $(dirname $(which $CC_FOR_TARGET))) \
  -ffunction-sections \
  -fdata-sections \
  -mno-relax \
"

$NEWLIB_SRC_DIR/configure --target=riscv32-unknown-elf \
  --disable-newlib-supplied-syscalls \
  --disable-nls \
  --enable-newlib-reent-small \
  --disable-newlib-fvwrite-in-streamio \
  --disable-newlib-fseek-optimization \
  --disable-newlib-wide-orient \
  --enable-newlib-nano-malloc \
  --disable-newlib-unbuf-stream-opt \
  --enable-lite-exit \
  --enable-newlib-global-atexit \
  --enable-newlib-nano-formatted-io \
  --disable-gdb

make -j$(nproc)
