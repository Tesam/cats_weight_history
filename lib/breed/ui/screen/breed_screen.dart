import 'package:cats_weight_history/breed/bloc/breed_bloc.dart';
import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:flutter/material.dart';

class BreedScreen extends StatefulWidget {
  @override
  _BreedScreenState createState() => _BreedScreenState();
}

class _BreedScreenState extends State<BreedScreen> {
  final breedBloc = BreedBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: breedBloc.breeds,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return (getBreedCardWidget(snapshot));
          } else {
            return CircularProgressIndicator(); // Display a Circular Progress Indicator if the data is not fetched
          }
        });
  }



  Widget getBreedCardWidget(snapshot) {
    return snapshot.data.length != 0
        ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, itemPosition) {
              Breed breed = snapshot.data[itemPosition];
              return Card(
                child: ListTile(
                  title: Text(breed.breed),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.red.shade400,
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
            child: Text(
              'Add some breed please.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ));
  }
}
