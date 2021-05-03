import 'package:flutter/material.dart';

import 'package:cats_weight_history/cat/model/cat.dart';
import 'package:cats_weight_history/cat/bloc/cat_bloc.dart';


class CatAddDialog extends StatelessWidget {
  final CatBloc catBloc;
  CatAddDialog({this.catBloc});

  final _formKey = GlobalKey<FormState>();
  final _catNameFormController = TextEditingController();

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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 66,
                    child: InputDecorator(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: 'Breed',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: "Americano",
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        underline: SizedBox.shrink(),
                        onChanged: (value) {
                        },
                        items: ["Americano", "Persa", "Tricolor"]
                            .map((e) => e)
                            .toList()
                            .map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Cat name',
                      hintText: 'Enter the cat name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some name';
                      }
                      return null;
                    },
                    controller: _catNameFormController,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          final newCat = Cat(
                            breedId: 13,
                            cat: _catNameFormController.value.text,);

                          _addCat(newCat);
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
                            'Add Cat',
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

  void _addCat(Cat cat) async {
    catBloc.inAddCat.add(cat);
  }
}
