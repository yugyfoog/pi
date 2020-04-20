#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "fast.h"

#define SIZE 6

uint64_t A[SIZE+2];

void test_fast_set() {
  int i;

  for (i = 0; i < SIZE+2; i++)
    A[i] = 0xaaaa5555aaaa5555;

  fast_set(&A[1], SIZE, 0);

  if (A[0] != 0xaaaa5555aaaa5555) {
    printf("fast_set failed\n");
    exit(1);
  }
  if (A[SIZE+1] != 0xaaaa5555aaaa5555) {
    printf("fast_set failed\n");
    exit(1);
  }
  for (i = 0; i < SIZE; i++) {
    if (A[i+1] != 0) {
      printf("fast_set failed\n");
      exit(1);
    }
  }
}

int main() {
  test_fast_set();
  return 0;
}
