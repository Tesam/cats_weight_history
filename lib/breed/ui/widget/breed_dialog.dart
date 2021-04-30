import 'package:cats_weight_history/breed/bloc/breed_bloc.dart';
import 'package:cats_weight_history/breed/model/breed.dart';
import 'package:flutter/material.dart';

class BreedDialog extends StatelessWidget {
  final BreedBloc breedBloc;
  BreedDialog({this.breedBloc});

  final _formKey = GlobalKey<FormState>();
  final _breedNameFormController = TextEditingController();
  //final breedBloc = BreedBloc();

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
                            breed: _breedNameFormController.value.text,);

                        //breedBloc.insertBreed(newBreed);
                        _addBreed(newBreed);
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

  void _addBreed(Breed breed) async {

    // Add this newly created note to the add note stream. Doing this
    // will trigger the listener in `notes_bloc.dart` and call `_handleAddNote`.
    breedBloc.inAddBreed.add(breed);
  }
}
