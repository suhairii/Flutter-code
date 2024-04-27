import 'package:flutter/material.dart';

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
        ));
  }
}
