import 'package:flutter/material.dart';
import 'package:widget_lanjutan/evaluasi.dart';
import 'package:widget_lanjutan/ninethpage.dart';

enum Answer { YES, NO }

class TwelvePage extends StatefulWidget {
  @override
  _TwelvePageState createState() => _TwelvePageState();
}

class _TwelvePageState extends State<TwelvePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Font'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 15.0,
            ),
            const Text(
              'PlayfairDisplay-Regular',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 30,
              ),
            ),
            Container(
              height: 15.0,
            ),
            const Text(
              'PlayfairDisplay-Italic',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
            Container(
              height: 15.0,
            ),
            const Text(
              'PlayfairDisplay-Bold',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EvaluasiPage(),
            ),
          );
          // Tambahkan logika untuk tombol floating di sini
        },
        backgroundColor: Colors.redAccent,
        label: Text("Evaluasi Page"),
        tooltip: 'Evaluasi Page',
        icon: Icon(Icons.navigate_next),
      ),
    );
  }
}
