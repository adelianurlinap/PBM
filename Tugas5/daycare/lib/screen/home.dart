import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/Users/Adel/AndroidStudioProjects/daycare/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input-data-anak');
                },
                child: Text('Input Data Anak'),
              ),
              SizedBox(height: 20), // Jarak antar tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input-kegiatan-anak');
                },
                child: Text('Input Kegiatan Anak'),
              ),
              SizedBox(height: 20), // Jarak antar tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/view-kegiatan-anak');
                },
                child: Text('Lihat Kegiatan Anak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}