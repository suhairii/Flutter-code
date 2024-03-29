import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// Muhammad Suhairi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil dan Biodata',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profil dan Biodata'),
        ),
        body: Center(
          child: ProfilBiodata(),
        ),
      ),
    );
  }
}

class ProfilBiodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(
              'images/profile.jpg'), 
        ),
        SizedBox(height: 20),
        Text(
          'Nama Lengkap: Muhammad Suhairi',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Tempat Tanggal Lahir: Teluk Lecah, 14 Januari 2004',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          'Email: suhairi14000@gmail.com',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Nomor HP: +62 82171300428',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Hobi: Menulis',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
