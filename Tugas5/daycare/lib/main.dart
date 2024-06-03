import 'package:flutter/material.dart';
import 'screen/login.dart';
import 'screen/registrasi.dart';
import 'screen/info_anak.dart';
import 'screen/input_aktifitas.dart';
import 'screen/view_aktifitas.dart';
import 'screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penitipan Anak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/input-data-anak': (context) => InputDataAnakPage(),
        '/input-kegiatan-anak': (context) => InputKegiatanAnakPage(),
        '/view-kegiatan-anak': (context) => ViewKegiatanAnakPage(),
      },
    );
  }
}