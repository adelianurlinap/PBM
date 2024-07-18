import 'package:flutter/material.dart';

class DailyReport {
  final String suhu;
  final String kondisi;
  final String sarapan;
  final String snack;
  final String lunch;
  final String tipeBotol;
  final String waktuBotol;
  //final String jumlahMl;
  final String dinner;
  final String mandiPagi;
  final String mandiSiang;
  final String vitamin;
  final String catatan;
  final String waktuMakanSiang;
  final String waktuMakanMalam;
  final String waktuMakanSnack;
  final String waktuSarapan;
  final String mulaiIstirahat;
  final String selesaiIstirahat;
  final List<String> barangDibutuhkan;

  DailyReport({
    required this.suhu,
    required this.kondisi,
    required this.sarapan,
    required this.snack,
    required this.lunch,
    required this.dinner,
    //required this.jumlahMl,
    required this.tipeBotol,
    required this.waktuBotol,
    required this.mandiPagi,
    required this.mandiSiang,
    required this.vitamin,
    required this.catatan,
    required this.waktuMakanSiang,
    required this.waktuMakanMalam,
    required this.waktuMakanSnack,
    required this.waktuSarapan,
    required this.mulaiIstirahat,
    required this.selesaiIstirahat,
    required this.barangDibutuhkan,
  });
}

class Anak {
  final String nama;
  final DateTime tanggalLahir;
  final String jenisKelamin;
  final String alamat;
  final String namaWali;
  final String nomorTelepon;
  final TimeOfDay jadwalKedatangan;
  List<DailyReport> dailyReports = [];

  Anak({
    required this.nama,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.alamat,
    required this.namaWali,
    required this.nomorTelepon,
    required this.jadwalKedatangan,
  });
}