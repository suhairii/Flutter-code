import 'package:flutter/material.dart';
import 'package:widget_lanjutan/seventhpage.dart';

class SixPage extends StatefulWidget {
  @override
  _SixPageState createState() => _SixPageState();
}

class _SixPageState extends State {
  final List<String> _names = [
    'Facebook',
    'instagram',
    'Youtube',
    'Twitter',
    'WhatsApp',
    'Linkedin',
    'Google+',
    'Snapchat',
    'Skype',
    'Spotify'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          _names.length,
          (index) {
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/${_names[index]}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SevenPage()));
          // Tambahkan logika untuk tombol floating di sini
        },
        tooltip: 'Tombol Floating',
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.green,
      ),
    );
  }
}
