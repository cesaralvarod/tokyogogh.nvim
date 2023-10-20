#include <stdio.h>

int main(void) {
  printf("Hello, world!\n");

  int x = 10;
  float y = 3.14;
  char c = 'a';

  if (x > 5 && y < 4.0) {
    printf("x is greater than 5 and y is less than 4.0\n");
  } else {
    printf(
        "x is less than or equal to 5 or y is greater than or equal to 4.0\n");
  }

  switch (c) {
  case 'a':
    printf("The character is a\n");
    break;
  case 'b':
    printf("The character is b\n");
    break;
  default:
    printf("The character is not a or b\n");
    break;
  }

  for (int i = 0; i < x; i++) {
    printf("i = %d\n", i);
  }

  while (x > 0) {
    printf("x = %d\n", x);
    x--;
  }

  return 0;
}
