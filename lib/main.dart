import 'package:exam/class.dart';
import 'package:exam/invicainfotech.dart';
import 'package:exam/postdiffcult.dart';
import 'package:exam/postmethod.dart';
import 'package:exam/productapi.dart';
import 'package:exam/streammm.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp( debugShowCheckedModeBanner: false,
    home: postdiff(),
  ));
}

class exam extends StatefulWidget {
  const exam({Key? key}) : super(key: key);

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: TextField(
                onTap: () {},
                controller: a,
                decoration: InputDecoration(
                    labelText: "Enter Value",
                    errorText: status ? model().s : null),
              ),
            ),
            ElevatedButton(
                onPressed: () {


                  setState(() {
                    if (a.text.isEmpty) {
                      status = true;
                    } else {
                      status = false;
                    }

                    
                  });

                  showModalBottomSheet(
                    builder: (context) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: 20,
                              margin: EdgeInsets.all(5),
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                            );
                          },
                        ),
                      );
                    },
                    context: context,
                  );
                },
                child: Text("Submit")),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(  shape: BoxShape.circle,
                            border: Border.all(width: 2),
                            image: DecorationImage(
                                image: AssetImage("images/p${index + 1}.jpg"),fit: BoxFit.cover)),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController a = TextEditingController();
}
