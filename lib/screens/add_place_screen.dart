import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleContoller = TextEditingController();

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
                ImageInput(),],
              ),
            ),
          )),
          ElevatedButton.icon(
            icon: Icon(
              Icons.add,
            ),
            label: Text('Add Place'),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
