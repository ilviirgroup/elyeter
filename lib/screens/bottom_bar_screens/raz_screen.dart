
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RazmestitScreen extends StatefulWidget {
  const RazmestitScreen({Key key}) : super(key: key);

  @override
  _RazmestitScreenState createState() => _RazmestitScreenState();
}

class _RazmestitScreenState extends State<RazmestitScreen> {
  File _image;
  final picker = ImagePicker();
  Future getGalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x800A6EB8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image,
            fit: BoxFit.fill,),
          ),


            FloatingActionButton(
              onPressed: getGalleryImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),
        ]),
      ),


    );
  }
}
