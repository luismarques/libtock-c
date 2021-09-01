/* vim: set sw=2 expandtab tw=80: */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <console.h>

char hello[] = "Hello World!\r\n";
int x = 42;
int *y = &x;

static void nop(
  int a __attribute__((unused)),
  int b __attribute__((unused)),
  int c __attribute__((unused)),
  void* d __attribute__((unused))) {}

int main(void) {
  putnstr_async(hello, strlen(hello), nop, NULL);
  printf("ePIC example: x=%d *y=%d &x=%p y=%p &main=%p.\n", x, *y, &x, y, &main);
  return 0;
}
