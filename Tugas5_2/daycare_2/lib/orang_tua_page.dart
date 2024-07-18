import 'package:flutter/material.dart';
import 'input_anak.dart';
import 'list_anak.dart';
import 'models.dart';

class OrtuPage extends StatelessWidget {
  final List<Anak> anakList;

  const OrtuPage({super.key, required this.anakList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _button(context),
            _logout(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        const Text(
          "Little Garden",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Text("Where Little Ones Blossom in Nature"),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'images/2.png', // Path to your image
            height: 150, // Adjust the height as needed
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _button(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputDataAnakPage(anakList: anakList),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.lightGreen,
          ),
          child: const Text(
            "Input Data Anak",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListAnakPage(anakList: anakList),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.lightGreen,
          ),
          child: const Text(
            "Lihat Aktivitas Anak",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}

_logout(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text("Keluar", style: TextStyle(color: Colors.lightGreen),)
      )
    ],
  );
}