//tipe objek
void main(List<String> args) {
 Person dadang = Person('Dadang', 25);
 Person dewi = Person('Dewi', 22);
 dadang.printPerson();
 print('Dadang adalah objek dari kelas Person ${dadang is Person}');
 dewi.printPerson();
 print('Dewi adalah objek dari kelas int ${dewi is int}');
}
class Person {
 String name = 'Tanpa Nama';
 int age = 0;
 Person(String name, int age) {
 this.name = name;
 this.age = age;
 }
 void printPerson() {
 print('Nama $name, umur $age tahun.');
 }
}