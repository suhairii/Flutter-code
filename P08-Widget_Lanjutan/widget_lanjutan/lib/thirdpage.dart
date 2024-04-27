import 'package:flutter/material.dart';
import 'package:widget_lanjutan/fourthpage.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State {
  double _volume = 0.0;

  final List<String> _list = [
    'Bengkalis',
    'Bantan',
    'Siak Kecil',
    'Rupat',
    'Rupat Utara',
    'Bukit Batu',
  ];
  String _item = 'Bengkalis';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Button'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Elevated Button",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Outline Button",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 5.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Text Button",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _volume += 10;
                  });
                },
                icon: const Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
              ),
              Text("Volume: $_volume"),
              const Text('Pilih Kecamatan: '),
              DropdownButton(
                value: _item,
                items: _list.map((String vall) {
                  return DropdownMenuItem(
                      value: vall,
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.location_city),
                          Text(vall),
                        ],
                      ));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _item = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FourthPage()));
        },
        backgroundColor: Colors.green,
        tooltip: "Navigate to Fourth Page",
        label: const Text('Go to Fourth Page'),
        icon: const Icon(Icons.arrow_forward),
        // backgroundColor: Colors.green,
        // tooltip: "Like",
        // label: const Text('Like'),
        // icon: const Icon(Icons.thumb_up),
        //   // backgroundColor: Colors.green,
        //   // tooltip: "Navigation",
        //   // child: const Icon(Icons.navigation),
      ),
    );
  }
}
