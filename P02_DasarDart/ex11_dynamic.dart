//variabel dynamic
void main(List<String> args) {
  dynamic x;
  x = 1;
  print("Nilai x\t: " + x.toString());
  print("Tipe x\t: " + x.runtimeType.toString());
  x = 123.456;
  print("Nilai x\t: " + x.toString());
  print("Tipe x\t: " + x.runtimeType.toString());
  x = true;
  print("Nilai x\t: " + x.toString());
  print("Tipe x\t: " + x.runtimeType.toString());
  x = 'Dart';
  print("Nilai x\t: " + x.toString());
  print("Tipe x\t: " + x.runtimeType.toString());
}
