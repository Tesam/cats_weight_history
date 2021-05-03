import 'package:flutter/material.dart';

import 'package:cats_weight_history/breed/bloc/breed_bloc.dart';
import 'package:cats_weight_history/breed/model/breed.dart';


class BreedUpdateDialog extends StatelessWidget {
  final BreedBloc breedBloc;
  final Breed breed;
  BreedUpdateDialog({this.breedBloc, this.breed}){
    _breedNameFormController.text = breed.breed;
  }

  final _formKey = GlobalKey<FormState>();
  final _breedNameFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some breed';
                      }
                      return null;
                    },
                    controller: _breedNameFormController,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          final newBreed = Breed(
                            id: breed.id,
                            breed: _breedNameFormController.value.text,
                          );
                            _updateBreed(newBreed);
                          Navigator.of(context,rootNavigator: true).pop();
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
                            'Update Breed',
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

  void _updateBreed(Breed breed) async {
    breedBloc.inUpdateBreed.add(breed);
  }
}
