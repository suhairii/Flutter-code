import 'package:flutter/material.dart';
import 'package:widget_lanjutan/thirdpage.dart'; // Sesuaikan dengan nama file thirdpage.dart yang sebenarnya
import 'package:widget_lanjutan/fourthpage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State {
  final List<String> settings = ['Data Seluler', 'Mode Pesawat', 'Wifi'];
  List<bool> settingValues = [false, false, false];

  double _sliderValue = 0.0;

  DateTime date = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030), // Ubah lastDate ke batasan yang diinginkan
    );
    if (selected != null && selected != date) {
      setState(() {
        date = selected;
      });
    }
  }

  // TimeOfDay _time = TimeOfDay.now();
  // Future<void> selectTime(BuildContext context) async {
  //   final TimeOfDay? selected =
  //       await showTimePicker(context: context, initialTime: _time);
  //   if (selected != _time) {
  //     setState(() {
  //       _time = selected!;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas Swicth dan SwicthListTile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              value: settingValues[0],
              title: Text(settings[0]),
              secondary: const Icon(Icons.language),
              onChanged: (bool value) {
                setState(() {
                  settingValues[0] = value;
                });
                print(settingValues);
              },
            ),
            const Divider(),
            SwitchListTile(
              value: settingValues[1],
              title: Text(settings[1]),
              secondary: const Icon(Icons.airplanemode_active),
              onChanged: (bool value) {
                setState(() {
                  settingValues[1] = value;
                });
                print(settingValues);
              },
            ),
            const Divider(),
            SwitchListTile(
              value: settingValues[2],
              title: Text(settings[2]),
              secondary: const Icon(Icons.wifi),
              onChanged: (bool value) {
                setState(() {
                  settingValues[2] = value;
                });
                print(settingValues);
              },
            ),
            const Divider(),
            Text('Brigthness: ${_sliderValue.round()}'),
            Slider(
              min: 0.0,
              max: 100.0,
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const Divider(),
            Text("Tanggal yang Anda pilih: ${date.toString()}"),
            ElevatedButton(
                onPressed: () {
                  selectDate(context);
                },
                child: const Text("Pilih Tanggal dan Bulan")),
            // const Divider(),
            // Text("waktu yang Anda pilih: ${_time.toString()}"),
            // ElevatedButton(
            //     onPressed: () {
            //       selectTime(context);
            //     },
            //     child: const Text("Pilih Waktu")),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: const Icon(Icons.arrow_right_alt_sharp))
          ],
        ),
      ),
    );
  }
}