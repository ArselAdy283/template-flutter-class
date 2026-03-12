import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as panggilhttp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 176, 56),
      appBar: AppBar(
        title: Text("Percobaan"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data akan muncul disini", style: TextStyle(fontSize: 25)),
            ElevatedButton(
              onPressed: () async {
                var respon = await panggilhttp.get(
                  Uri.parse(
                    "https://69b01423c63dd197febb3152.mockapi.io/api/v1/post/1",
                  ),
                );
                Map<String, dynamic> data =
                    json.decode(respon.body) as Map<String, dynamic>;
                print("Usernamenya ${data["username"]}");
              },
              child: Text("Get Data", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
