import 'package:flutter/material.dart';
import 'package:rute_navigasi/drawer.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Snackbar'),
      ),
      body: Center(child: Builder(builder: (BuildContext context1) {
        return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Pesan ditampilkan dengan cara pertama'),
                ),
              );
            },
            child: Text('Tampilkan Pesan'));
      })),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdPage()));
        },
        label: const Text('Drawer'),
        tooltip: 'Drawer',
        icon: Icon(Icons.navigate_next),
      ),
    );
  }
}
