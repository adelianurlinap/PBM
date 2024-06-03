import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputKegiatanAnakPage extends StatefulWidget {
  @override
  _InputKegiatanAnakPageState createState() => _InputKegiatanAnakPageState();
}

class _InputKegiatanAnakPageState extends State<InputKegiatanAnakPage> {
  final _activityController = TextEditingController();
  final _timeController = TextEditingController();

  Future<void> _saveActivity() async {
    final prefs = await SharedPreferences.getInstance();
    final currentActivities = prefs.getStringList('activities') ?? [];
    currentActivities.add('${_activityController.text} Pukul ${_timeController.text}');
    await prefs.setStringList('activities', currentActivities);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kegiatan Disimpan')),
    );
    _activityController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Kegiatan Anak')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Kegiatan Anak'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Waktu (contoh: 14:00)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveActivity,
              child: Text('Simpan Kegiatan'),
            ),
          ],
        ),
      ),
    );
  }
}