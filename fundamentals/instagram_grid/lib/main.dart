import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text("Gallely", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          children: [
            Container(
              color: Colors.red,
              child: Image.asset('assets/1.png', fit: BoxFit.cover,)
            ),
            Container(
                color: Colors.red,
                child: Image.asset('assets/2.png', fit: BoxFit.cover,)
            ),
            Container(
                color: Colors.red,
                child: Image.asset('assets/3.png', fit: BoxFit.cover,)
            ),
            Container(
                color: Colors.red,
                child: Image.asset('assets/4.png', fit: BoxFit.cover,)
            ),
            Container(
                color: Colors.red,
                child: Image.asset('assets/5.png', fit: BoxFit.cover,)
            ),
            Container(
                color: Colors.red,
                child: Image.asset('assets/6.png', fit: BoxFit.cover,)
            ),
          ],
        ),
      ),
    );
  }
}