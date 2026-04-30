import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String hasilRespon = 'belum ada data';

  TextEditingController idC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP PUT/PATCH")),
      body: ListView(
        padding: EdgeInsets.all(16.0),

        children: [
          TextField(
            controller: idC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "ID",
            ),
          ),
          SizedBox(height: 16.0),

          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 16.0),

          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(height: 16.0),

          ElevatedButton(
            onPressed: () async {
              var response = await http.patch(
                Uri.parse(
                  "https://69db9329560857310a07cf04.mockapi.io/api/v1/users/23",
                ),
                headers: {"Conteny-Type": "application/json"},
                body: {"id": idC.text, "name": nameC.text, "job": jobC.text},
              );
              Map<String, dynamic> data =
                  json.decode(response.body) as Map<String, dynamic>;

              setState(() {
                hasilRespon =
                    "Respon: ${data['id']} - ${data['name']} - ${data['job']}";
              });
            },
            child: Text("SUBMIT"),
          ),

          SizedBox(height: 50),
          Divider(color: Colors.black),
          SizedBox(height: 10),

          Text(hasilRespon),
        ],
      ),
    );
  }
}
