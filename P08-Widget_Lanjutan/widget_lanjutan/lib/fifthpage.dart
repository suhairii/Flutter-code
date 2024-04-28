import 'package:flutter/material.dart';
import 'package:widget_lanjutan/sixthpage.dart';

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State {
  List<Widget> createItems(int count) {
    List<Widget> items = <Widget>[];
    for (var i = 0; i < count; i++) {
      items.add(ListTile(
        title: Text("Item ${i + 1}"),
        leading: const Icon(Icons.star),
        trailing: const Icon(Icons.delete),
      ));
      items.add(
        const Divider(color: Colors.black26),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas ListView'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: createItems(20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SixPage()));
          // Tambahkan logika untuk tombol floating di sini
        },
        tooltip: 'Tombol Floating',
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
