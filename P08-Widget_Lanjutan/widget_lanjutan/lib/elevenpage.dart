import 'package:flutter/material.dart';
import 'package:widget_lanjutan/ninethpage.dart';
import 'package:widget_lanjutan/twelvepage.dart';

enum Answer { YES, NO }

class EleventPage extends StatefulWidget {
  @override
  _ElevenPageState createState() => _ElevenPageState();
}

class _ElevenPageState extends State<EleventPage> {
  void buildAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: const Text('Informasi'),
      content: const Text('Flutter sangat luar biasa'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  String answer = '';
  String message = '';

  void setAnswer(String value) {
    setState(() {
      answer = value;
      message = 'Anda memilih: $answer';
    });
  }

  Future<void> confirm(BuildContext context) async {
    var simpleDialog = SimpleDialog(
      title: const Text('Konfirmasi'),
      children: <Widget>[
        Column(children: <Widget>[
          const Text('Anda ingin keluar dari Aplikiasi?'),
          Container(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                child: const Text(
                  'Ya',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, Answer.YES);
                },
              ),
              Container(
                width: 5.0,
              ),
              ElevatedButton(
                child: const Text(
                  'Tidak',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, Answer.NO);
                },
              ),
              Container(
                width: 5.0,
              ),
            ],
          )
        ])
      ],
    );
    if (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return simpleDialog;
            }) ==
        Answer.YES) {
      setAnswer('Ya');
    } else {
      setAnswer('Tidak');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Dialog'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 15.0,
            ),
            ElevatedButton(
              child: const Text('Show dialog'),
              onPressed: () {
                confirm(context);
              },
            ),
            Container(
              height: 15.0,
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              child: const Text("Show Dialog"),
              onPressed: () {
                buildAlertDialog(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TwelvePage(),
            ),
          );
          // Tambahkan logika untuk tombol floating di sini
        },
        tooltip: 'Tombol Floating',
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
