//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  final _picker = ImagePicker();

  Future<void> _takePicture() async {
    //final imageFile = await ImagePicker.getImage(source: ImageSource.camera,maxWidth: 600,);

    PickedFile image = await _picker.getImage(source: ImageSource.camera, maxWidth: 600);
    final File imageFile = File(image.path);

    setState(() {
      _storedImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(height: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text(
              'Take Picture',
            ),
            onPressed: _takePicture
          ),
        )
      ],
    );
  }
}
