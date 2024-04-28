import 'package:flutter/material.dart';
import 'package:widget_lanjutan/fifthpage.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Kontainer'),
      ),
      body: Container(
        child: const Text(
          'RPL Polbeng',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.green,
        width: 250,
        height: 100,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FifthPage(),
            ),
          );
        },
        child: const Icon(Icons.navigate_next_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }
}
