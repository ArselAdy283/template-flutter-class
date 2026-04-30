import 'package:flutter/material.dart';

class chatPage extends StatelessWidget {
  const chatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"), backgroundColor: Colors.orange),
      body: 
        Center(
          child: Text("Chat"),
      ),
    );
  }
}