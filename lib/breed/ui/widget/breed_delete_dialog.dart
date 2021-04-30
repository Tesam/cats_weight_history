import 'package:flutter/material.dart';

import 'package:cats_weight_history/breed/bloc/breed_bloc.dart';
import 'package:cats_weight_history/breed/model/breed.dart';

class BreedDeleteDialog extends StatelessWidget {
  final BreedBloc breedBloc;
  final Breed breed;

  BreedDeleteDialog({this.breedBloc, this.breed});

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
                backgroundColor: Colors.green.shade500,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Delete Breed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                child: RichText(
                  text: TextSpan(
                    text: "Would you like to delete the ",
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "${breed.breed} ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "breed?",
                      )
                    ]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
              ),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
