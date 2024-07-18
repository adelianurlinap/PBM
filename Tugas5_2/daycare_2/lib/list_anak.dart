import 'package:flutter/material.dart';
import 'report_aktifitas_anak.dart';
import 'lihat_aktifitas_anak.dart';
import 'models.dart';

class ListAnakPage extends StatefulWidget {
  final List<Anak> anakList;

  const ListAnakPage({super.key, required this.anakList});

  @override
  _ListAnakPageState createState() => _ListAnakPageState();
}

class _ListAnakPageState extends State<ListAnakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Anak"),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.separated(
        itemCount: widget.anakList.length,
        itemBuilder: (context, index) {
          final anak = widget.anakList[index];
          return ListTile(
            title: Text(anak.nama),
            subtitle: Text('Orang Tua: ${anak.namaWali}'),
            trailing: IconButton(
              icon: const Icon(Icons.note_add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailyReportPage(anakList: widget.anakList, anak: anak),
                  ),
                );
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LihatAktivitasAnakPage(anak: anak),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          );
        },
      ),
    );
  }
}