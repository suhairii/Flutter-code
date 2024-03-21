class Mahasiswa {
  String name;
  Function(String name) doingHobby;
  Mahasiswa(this.name, {this.doingHobby = _defaultHobby});

  void takeARest() {
    if (doingHobby != null) {
      doingHobby(name);
    }
  }

  static void _defaultHobby(String name) {
    print('$name is taking a rest.');
  }
}
