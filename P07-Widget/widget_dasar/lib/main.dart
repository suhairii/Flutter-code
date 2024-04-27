import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deskripsi Hari',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Deskripsi Hari'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: DeskripsiHari(),
        ),
      ),
    );
  }
}

class DeskripsiHari extends StatelessWidget {
  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  final Map<String, String> descriptions = {
    'Senin': 'Hari yang luar biasa untuk memulai pekerjaanmu.',
    'Selasa': 'Tetap semangat mengerjakan tugas.',
    'Rabu': 'Selalu bahagia dan bersyukur dengan apa yang telah diperoleh.',
    'Kamis': 'Kerja keras untuk menggapai cita-cita.',
    'Jumat': 'Jangan lupa untuk beribadah.',
    'Sabtu': 'Selamat weekend.',
    'Minggu': 'Manfaatkan hari minggumu untuk istirahat.',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: days.map((day) {
        return ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(day),
                  content: Text(descriptions[day] ?? ''),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(day),
        );
      }).toList(),
    );
  }
}
