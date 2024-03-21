//blok program
void main(List<String> args) {
  int a = 9;
  if (a > 0) {
    //ditandai dengan kurung kurawal, blok adalah kumpulan dari suatu statement
    print('Nilai a: $a');
    print('a adalah bilangan positif');
  }
  int i = 0;
  while (i < a) {
    print('Baris ke-$i');
    i++;
  }
}
