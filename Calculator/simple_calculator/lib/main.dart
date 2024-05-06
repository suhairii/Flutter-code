import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Kalkulator UTS Suhairi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

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
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(16)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('History'),
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
                        child: const Text('Close'),
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
            padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
            child: Text(
              _output,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('7', Colors.grey),
                      buildButton('8', Colors.grey),
                      buildButton('9', Colors.grey),
                      buildButton('/', Colors.orange),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('4', Colors.grey),
                      buildButton('5', Colors.grey),
                      buildButton('6', Colors.grey),
                      buildButton('*', Colors.orange),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('1', Colors.grey),
                      buildButton('2', Colors.grey),
                      buildButton('3', Colors.grey),
                      buildButton('-', Colors.orange),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
