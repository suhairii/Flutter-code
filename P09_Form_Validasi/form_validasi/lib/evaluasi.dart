import 'package:flutter/material.dart';

class EvaluasiPage extends StatefulWidget {
  const EvaluasiPage({Key? key}) : super(key: key);

  @override
  _EvaluasiPageState createState() => _EvaluasiPageState();
}

class _EvaluasiPageState extends State<EvaluasiPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _role = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validasi berhasil, bisa dilakukan aksi selanjutnya seperti simpan data
      // Misalnya: simpanData();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Data Submitted'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Username: ${_usernameController.text}'),
                  Text('Email: ${_emailController.text}'),
                  Text('Nomor HP: ${_nomorHpController.text}'),
                  Text('Role: $_role'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluasi Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    hintText: 'Username',
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person_pin)),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 4 ||
                      value.length > 25 ||
                      value.contains(RegExp(r'\d'))) {
                    return 'Username harus terdiri dari 4-25 karakter, tanpa angka';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.mail_outline)),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      value.length < 4 ||
                      value.length > 25) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),

              TextFormField(
                controller: _nomorHpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Nomor HP',
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.phone_android),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 10 ||
                      value.length > 12 ||
                      !value.contains(RegExp(r'^[0-9]+$'))) {
                    return 'Nomor HP harus terdiri dari 10-12 angka';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 4 ||
                      value.length > 25) {
                    return 'Password harus terdiri dari 4-25 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value != _passwordController.text) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              // Radio Button
              ListTile(
                title: const Text('User'),
                leading: Radio<String>(
                  value: 'user',
                  groupValue: _role,
                  onChanged: (value) {
                    setState(() {
                      _role = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Admin'),
                leading: Radio<String>(
                  value: 'admin',
                  groupValue: _role,
                  onChanged: (value) {
                    setState(() {
                      _role = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
