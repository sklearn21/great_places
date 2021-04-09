import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleContoller = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if (_titleContoller.text.isEmpty || _pickedImage == null){
      return ;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleContoller
        .text,
        _pickedImage);

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleContoller,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ImageInput(_selectImage),],
              ),
            ),
          )),
          ElevatedButton.icon(
            icon: Icon(
              Icons.add,
            ),
            label: Text('Add Place'),
            onPressed: _savePlace,
            // onPressed: () {
            //
            //   Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            // },
          ),
        ],
      ),
    );
  }
}
