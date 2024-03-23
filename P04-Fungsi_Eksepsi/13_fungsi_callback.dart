double hitung(double a, double b, Function operation) {
  return operation(
      a, b); //operation adalah sebuah fungsi yang punya 2 parameter
}

double add(double a, double b) => a + b;
double multiply(double a, double b) => a * b;
double div(double a, double b) => a / b;
void main(List<String> args) {
  print('12.0 + 3.0 = ${hitung(12.0, 3.0, add)}');
  print('12.0 * 3.0 = ${hitung(12.0, 3.0, multiply)}');
  print('12.0 / 3.0 = ${hitung(12.0, 3.0, div)}');
}
