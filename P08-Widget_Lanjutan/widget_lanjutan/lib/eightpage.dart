import 'package:flutter/material.dart';
import 'package:widget_lanjutan/ninethpage.dart';

class EightPage extends StatefulWidget {
  @override
  _EightPageState createState() => _EightPageState();
}

class _EightPageState extends State {
  final int _count = 20;
  final List<bool> _items = <bool>[];
  @override
  void initState() {
    super.initState();
    setState(() {
      for (var i = 0; i < _count; i++) {
        _items.add(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Expand'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.orange,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.indigo,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NinePage(),
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
