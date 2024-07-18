import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'input_anak.dart';
import 'list_anak.dart';
import 'orang_tua_page.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Anak> anakList = [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Little Garden App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginPage(anakList: anakList),
      routes: {
        '/login': (context) => LoginPage(anakList: anakList),
        '/signup': (context) => const SignupPage(),
        '/input_data_anak': (context) => InputDataAnakPage(anakList: anakList),
        '/list_anak': (context) => ListAnakPage(anakList: anakList), // Use the same list
        '/ortu': (context) => OrtuPage(anakList: anakList),
      },
    );
  }
}