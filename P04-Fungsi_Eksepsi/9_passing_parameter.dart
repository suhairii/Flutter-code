List<int> reverse(List<int> data) {
  List<int> result = [];
  for (int i = data.length - 1; i >= 0; i--) {
    result.add(data[i]);
  }
  return result;
}

void main(List<String> args) {
  List<int> aList = [1, 2, 3, 4, 5];
  print('Sebelum dibalik:');
  print(aList.toString());
  print('\nSetelah dibalik:');
  print(reverse(aList).toString());
}
