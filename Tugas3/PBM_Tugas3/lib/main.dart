import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> thumbList = [
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il7.jpeg',
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il2.jpg',
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il3.jpg',
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il4.jpg',
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il5.jpg',
    '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/il6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'NCT 127 THE UNITY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0), // Add padding around the entire page
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double height = constraints.maxWidth * 0.5;
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: height,
                      child: Image.asset(
                        '/Users/Adel/AndroidStudioProjects/PBM_Tugas3/images/ill.jpg',
                        fit: BoxFit.cover, // Cover to fill the box
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                TextSection(
                  description:
                  'Neo City – The Unity (or NCT 127 3rd Tour \"NEO CITY – THE UNITY\") was third concert tour headlined by NCT 127'
                    'the Seoul-based sub-unit of South Korean boy group NCT, in support of their fifth studio album Fact Check (2023).'
                    'The tour began in November 2023 with six shows at the KSPO Dome in Seoul, South Korea, and continue in 2024 with 13 additional shows in Asia. The tour concluded on March 10, 2024, in Tokyo, Japan.',
                    textAlign: TextAlign.center, // Center align the text
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(thumbList.length, (index) {
                    return Image.asset(thumbList[index]);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
     );
    }
  }

class TextSection extends StatelessWidget {
  final String description;
  final TextAlign textAlign;
  final TextStyle style;

  const TextSection({
    required this.description,
    this.textAlign = TextAlign.left,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: textAlign,
      style: style,
    );
  }
}