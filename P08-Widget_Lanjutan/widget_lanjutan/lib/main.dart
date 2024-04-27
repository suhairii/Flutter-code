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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Percobaan Menggunakan Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
              // ElevatedButton(
              //   child: const Text('Submit'),
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (BuildContext) {
              //           return AlertDialog(
              //             content: Text("Hallo Apa kabar $_name"),
              //           );
              //         });
              //   },
              // ),
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
