import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              }),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('Got no '
                          'places yet, '
                          'start '
                          'adding some!'),
                    ),
                    builder: (context, greatPlaces, ch) =>
                        greatPlaces.items.length <= 0
                            ? ch
                            : ListView.builder(
                                itemCount: greatPlaces.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(greatPlaces.items[i].image),
                                  ),
                                  title: Text(greatPlaces.items[i].title),
                                  onTap: () {
                                    //Goto detail page....
                                  },
                                ),
                              ),
                  ),
      ),
    );
  }
}
