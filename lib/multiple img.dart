import 'dart:io';

import 'package:exam/postdiffcult.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class multiimage1 extends StatefulWidget {





  @override
  State<multiimage1> createState() => _multiimage1State();
}

class _multiimage1State extends State<multiimage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multiple Images'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  selectImages();
                },
                child: Text('Select Images'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    
                      itemCount: imageFileList!.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(File((imageFileList![index].path)),
                          fit: BoxFit.cover,);
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState((){});
  }

}
