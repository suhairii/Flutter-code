import 'dart:io';

class NegativeError implements Exception {
  String message;
  NegativeError([this.message = "Nilai tidak boleh negative"]);
}

void main(List<String> args) {
  int a;
  try {
    stdout.write('Masukkan bilangan non-negatif: ');
    a = int.parse(stdin.readLineSync()!);
    if (a < 0) {
      throw NegativeError();
    }
    print('Anda memasukkan nilai $a.');
  } on FormatException catch (exception, stackTrace) {
    print('SALAH: nilai yang dimasukkan bukan bilangan.');
  } on NegativeError catch (exception, stackTrace) {
    print('SALAH: anda memasukkan nilai negatif.');
  } catch (exception, stackTrace) {
    print('SALAH: terjadi eksepsi bertipe $exception.');
  }
}
