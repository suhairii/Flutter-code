import 'package:flutter/material.dart';

class EvaluasiPage extends StatefulWidget {
  const EvaluasiPage({Key? key}) : super(key: key);

  @override
  _EvaluasiPageState createState() => _EvaluasiPageState();
}

class _EvaluasiPageState extends State<EvaluasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Evaluasi Page'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman evaluasi',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
