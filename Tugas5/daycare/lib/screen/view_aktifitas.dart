import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewKegiatanAnakPage extends StatefulWidget {
  @override
  _ViewKegiatanAnakPageState createState() => _ViewKegiatanAnakPageState();
}

class _ViewKegiatanAnakPageState extends State<ViewKegiatanAnakPage> {
  List<String> _activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activities = prefs.getStringList('activities') ?? ['Tidak ada aktifitas'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kegiatan Anak')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _activities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_activities[index]),
            );
          },
        ),
      ),
    );
  }
}