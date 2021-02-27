import 'package:cats_weight_history/breed/bloc/breed_bloc.dart';
import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:flutter/material.dart';

class BreedDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final breedBloc = BreedBloc();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red.shade400,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Breed',
                      hintText: 'Enter the breed',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        final newBreed = Breed(breed: 'Bombay');
                        breedBloc.insertBreed(newBreed);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Add Breed',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
