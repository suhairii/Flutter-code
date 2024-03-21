void main(List<String> args) {
  print(2 is int);
  print(2 is num);
  print(2 is! String);
  print([1, 2, 3] is Map);

  int? a = 9, b = 10;
  print(a.isOdd);
  print(a.isEven);
  int maks = a > b ? a : b;
  // int maks;
  // if (a > b) {
  //   maks = a;
  // } else {
  //   maks = b;
  // }
  print('Nilai max dari $a dan $b adalah $maks');
  a = null;
  int c = (a ?? b);
  print('Nilai c: $c');
}
