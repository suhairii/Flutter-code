import 'package:flutter/material.dart';
import 'package:widget_lanjutan/eightpage.dart';

class SevenPage extends StatefulWidget {
  @override
  _SevenPageState createState() => _SevenPageState();
}

class _SevenPageState extends State {
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
        title: Text('Kelas Card'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5.5),
        itemCount: _count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
            child: GestureDetector(
              child: ListTile(
                title: Text('Item ${index + 1}'),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.delete),
              ),
              onTap: () {
                print('Anda memilih item ${index + 1}');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EightPage()));
          // Tambahkan logika untuk tombol floating di sini
        },
        tooltip: 'Tombol Floating',
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.green,
      ),
    );
  }
}
