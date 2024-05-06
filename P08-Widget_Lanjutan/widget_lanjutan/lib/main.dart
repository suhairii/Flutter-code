import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_lanjutan/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Percobaan Menggunakan Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = '';
  final TextEditingController _controller = TextEditingController();
  bool _checkboxVal1 = false;
  bool _checkboxVal2 = false;
  bool _checkboxVal3 = false;
  bool _checkboxVal4 = false;
  int _selected = -1;
  String _jeniskelamin = "-";
  final List<String> settings = ['Wi-Fi', 'Data Seluler', 'Mode Pesawat'];
  List<bool> settingValues = [false, false, false];

  List<String> list = [];
  String text = '';
  void showData() {
    text = '';
    for (int i = 0; i < list.length; i++) {
      text += '${list[i]}';
    }
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        // backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                onChanged: (String value) {
                  _name = value;
                },
                decoration: const InputDecoration(
                    hintText: 'Masukkan nama anda!',
                    hintStyle: TextStyle(fontStyle: FontStyle.normal),
                    labelText: 'Nama Anda',
                    icon: Icon(Icons.person_pin),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Bahasa pemrograman yang dikuasai:'),
              CheckboxListTile(
                  value: _checkboxVal1,
                  title: const Text('Python'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.language),
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal1 = value!;
                    });
                    if (this._checkboxVal1 == true) {
                      list.add(' Python');
                    } else {
                      list.remove(' Python');
                    }
                    showData();
                  }),
              CheckboxListTile(
                  value: _checkboxVal2,
                  title: const Text('Java'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.language),
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal2 = value!;
                    });
                    if (this._checkboxVal2 == true) {
                      list.add(' Java');
                    } else {
                      list.remove(' Java');
                    }
                    showData();
                  }),
              CheckboxListTile(
                  value: _checkboxVal3,
                  title: const Text('Dart'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.language),
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal3 = value!;
                    });
                    if (this._checkboxVal3 == true) {
                      list.add(' Dart');
                    } else {
                      list.remove(' Dart');
                    }
                    showData();
                  }),
              CheckboxListTile(
                  value: _checkboxVal4,
                  title: const Text('PHP'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.language),
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal4 = value!;
                    });
                    if (this._checkboxVal4 == true) {
                      list.add(' PHP');
                    } else {
                      list.remove(' PHP');
                    }
                    showData();
                  }),
              Container(height: 10.0),
              const Text('Jenis Kelamin'),
              RadioListTile(
                  value: 0,
                  groupValue: _selected,
                  title: const Text('Laki-laki'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.person),
                  onChanged: (int? value) {
                    setState(() {
                      _selected = value!;
                      _jeniskelamin = 'Laki-laki';
                    });
                  }),
              RadioListTile(
                  value: 1,
                  groupValue: _selected,
                  title: const Text('Perempuan'),
                  activeColor: Colors.greenAccent,
                  secondary: Icon(Icons.person),
                  onChanged: (int? value) {
                    setState(() {
                      _selected = value!;
                      _jeniskelamin = 'Perempuan';
                    });
                  }),

              Container(
                height: 10.0,
              ),
              Text('Jenis Kelamin Anda: $_jeniskelamin'),
              Text('Bahasa Yang Dikuasai: $text'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text('Next Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
