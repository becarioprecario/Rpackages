#include<stdio.h>

double inner(double x, double y, int n) {
  double res = 0;

  int i;

  for(i = 0; i < n; i++) {
    res + = x[i] * y[i];
  }

  return res;
}


