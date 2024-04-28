import 'package:flutter/material.dart';
import 'package:form_validasi/evaluasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Form & Validasi'),
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late FocusNode myFocusNode;

  final prodiController = TextEditingController();
  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final semesterController = TextEditingController();

  void printValue() {
    print("Text pada field Program Studi: ${prodiController.text}");
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    prodiController.addListener(printValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void validateInput() {
    FormState? form = formKey.currentState;
    const snackBar = SnackBar(
      content: Text('Semua data sudah tervalidasi'),
    );
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showData();
    }
  }

  showData() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              'Nim : ${nimController.text} \nNama : ${namaController.text}\nProdi: ${prodiController.text}\nSemester: ${semesterController.text}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nimController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Nim',
                      labelText: "Nim",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person_pin),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Nim tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      hintText: 'Nama',
                      labelText: "Nama",
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                    },
                    focusNode: myFocusNode,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: prodiController,
                    decoration: const InputDecoration(
                      hintText: 'Program Studi',
                      labelText: "Program Studi",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.dashboard),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Program tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: semesterController,
                    decoration: const InputDecoration(
                      hintText: 'Semester',
                      labelText: "Semester",
                      icon: Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Semester tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (validateInput),
                        child: const Text("Submit"),
                      ),
                      Container(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(myFocusNode);
                          },
                          child: const Text("Fokus Ke Nama"))
                    ],
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EvaluasiPage()),
          );
        },
        label: const Text("Evaluasi Page"),
        tooltip: 'Evaluasi',
        icon: Icon(Icons.navigate_next),
      ),
    );
  }
}
