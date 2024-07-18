import 'package:flutter/material.dart';
import 'models.dart';

class LihatAktivitasAnakPage extends StatelessWidget {
  final Anak anak;

  const LihatAktivitasAnakPage({super.key, required this.anak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Aktivitas Anak"),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: anak.dailyReports.length,
        itemBuilder: (context, index) {
          final report = anak.dailyReports[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Anak: ${anak.nama}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Suhu Tubuh: ${report.suhu}"),
                    Text("Kondisi: ${report.kondisi}"),
                    Text("Sarapan: ${report.sarapan}"),
                    Text("Waktu Sarapan: ${report.waktuSarapan}"),
                    Text("Snack: ${report.snack}"),
                    Text("Waktu Makan Snack: ${report.waktuMakanSnack}"),
                    Text("Makan Siang: ${report.lunch}"),
                    Text("Waktu Makan Siang: ${report.waktuMakanSiang}"),
                    Text("Makan Malam: ${report.waktuBotol}"),
                    Text("Waktu Makan Malam: ${report.waktuMakanMalam}"),
                    Text("Waktu Mulai Istirahat: ${report.mulaiIstirahat}"),
                    Text("Waktu Selesai Istirahat: ${report.selesaiIstirahat}"),
                    Text("Waktu Minum Susu: ${report.waktuBotol}"),
                    //Text("Jumlah (ml): ${report.jumlahMl}"),
                    Text("Tipe Susu: ${report.tipeBotol}"),
                    Text("Mandi Pagi: ${report.mandiPagi}"),
                    Text("Mandi Siang: ${report.mandiSiang}"),
                    Text("Vitamin: ${report.vitamin}"),
                    Text("Catatan: ${report.catatan}"),
                    const SizedBox(height: 8),
                    Text("Barang yang Dibutuhkan: ${report.barangDibutuhkan.join(', ')}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}