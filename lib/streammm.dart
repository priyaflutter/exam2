// Stream is State Managment Tool
// Whwre two Proccesed Strem And  Sink
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class mystremm extends StatefulWidget {
  const mystremm({Key? key}) : super(key: key);

  @override
  State<mystremm> createState() => _mystremmState();
}

class _mystremmState extends State<mystremm> {
  StreamController<String> mm = StreamController<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton:FloatingActionButton(onPressed: () {
        getdata();
      },),
      body: StreamBuilder(
        stream: mm.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            return Text("${snapshot.data.toString()}");
          }
          else {

            return Text("LOADING...");
          }
        },
      ),
    );
  }

  getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    mm.sink.add(response.body);


  }
}
