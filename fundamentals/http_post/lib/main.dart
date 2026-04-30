import 'dart:convert';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleC = TextEditingController();
  TextEditingController bodyC = TextEditingController();
  TextEditingController captionC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTTP POST')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: bodyC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Body',
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: captionC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Caption',
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.post(
                Uri.parse(
                  "https://69b01423c63dd197febb3152.mockapi.io/api/v1/post",
                ),

                body: {"title": titleC.text, "body": bodyC.text, "caption": captionC.text},
              );

              Map<String, dynamic> data = jsonDecode(myresponse.body);
              setState(() {
                hasilResponse =
                    "ID: ${data['id']}, Title: ${data['title']}, Body: ${data['body']}, Caption: ${data['caption']}";
              });
            },
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.indigoAccent),
          SizedBox(height: 15),

          Text("hasilResponse: $hasilResponse"),
        ],
      ),
    );
  }
}
