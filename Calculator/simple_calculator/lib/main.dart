import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _output = '0';
  String _expression = '';
  List<String> history = [];

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _expression = '';
      } else if (buttonText == '=') {
        _expression = _output;
        _output = _evaluateExpression(_expression);
        history.add(_expression + ' = $_output');
        _expression = '';
      } else {
        _expression += buttonText;
        _output = _expression;
      }
    });
  }

  String _evaluateExpression(String expression) {
    String result = '';
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      result = exp.evaluate(EvaluationType.REAL, cm).toString();
    } catch (e) {
      result = 'Error';
    }
    return result;
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(24)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('History'),
                    content: Container(
                      width: double.minPositive,
                      height: 300.0,
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(history[index]),
                          );
                        },
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton('7', Colors.grey),
                      buildButton('8', Colors.grey),
                      buildButton('9', Colors.grey),
                      buildButton('/', Colors.orange),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton('4', Colors.grey),
                      buildButton('5', Colors.grey),
                      buildButton('6', Colors.grey),
                      buildButton('*', Colors.orange),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton('1', Colors.grey),
                      buildButton('2', Colors.grey),
                      buildButton('3', Colors.grey),
                      buildButton('-', Colors.orange),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton('C', Colors.red),
                      buildButton('0', Colors.grey),
                      buildButton('=', Colors.green),
                      buildButton('+', Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
