#define EXP 2.71828182846

double Exponent(int x){
  double result = 1;
  for(int i = 0; i < x; i++){
    result *= EXP;
  }
  return result;
}

double Power(double x, int y){
  double result = 1;
  if(y > 0)
    for(int i = 0; i < y; i++){
      result *= x;
    }
  else
    for(int i = 0; i > y; i--){
      result /= x;
    }
  return result;
}
