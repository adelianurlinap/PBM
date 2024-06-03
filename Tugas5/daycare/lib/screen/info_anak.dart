import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputDataAnakPage extends StatefulWidget {
  @override
  _InputDataAnakPageState createState() => _InputDataAnakPageState();
}

class _InputDataAnakPageState extends State<InputDataAnakPage> {
  final _dateTimeController = TextEditingController();
  final _childNameController = TextEditingController();
  final _parentNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _temperatureController = TextEditingController();
  final _conditionController = TextEditingController();
  final _notesController = TextEditingController();

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('dateTime', _dateTimeController.text);
    await prefs.setString('childName', _childNameController.text);
    await prefs.setString('parentName', _parentNameController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('temperature', _temperatureController.text);
    await prefs.setString('condition', _conditionController.text);
    await prefs.setString('notes', _notesController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Data Anak')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dateTimeController,
              decoration: InputDecoration(labelText: 'Waktu Kedatangan'),
            ),
            TextField(
              controller: _childNameController,
              decoration: InputDecoration(labelText: 'Nama Anak'),
            ),
            TextField(
              controller: _parentNameController,
              decoration: InputDecoration(labelText: 'Nama Orang Tua'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Umur Anak'),
            ),
            TextField(
              controller: _temperatureController,
              decoration: InputDecoration(labelText: 'Suhu Tubuh Anak'),
            ),
            TextField(
              controller: _conditionController,
              decoration: InputDecoration(labelText: 'Kondisi Anak (Sehat / Sakit)'),
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Catatan dari Orang Tua'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Simpan Data'),
            ),
          ],
        ),
      ),
    );
  }
}