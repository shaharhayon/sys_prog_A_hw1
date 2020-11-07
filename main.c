#include <stdio.h>
#include "myMath.h"

int main() {
  double x, result1, result2, result3;
  printf("Enter a double (Real number): ");
  scanf("%lf", &x);
  result1 = sub(add(Exponent((int)x), Power(x, 3)), 2);
  result2 = add(mul(x, 3), mul(Power(x, 2), 2));
  result3 = sub(div(mul(Power(x, 3), 4), 5), mul(x, 2));
  printf("The value of f(x) = e^x + x^3 - 2 at the point %g is: %.4f\n", x, result1);
  printf("The value of f(x) = 3x + 2(x^2) at the point %g is: %.4f\n", x, result2);
  printf("The value of f(x) = (4(x^3)/5 - 2x)at the point %g is: %.4f\n", x, result3);
  return 0;
}
