import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cat"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add, ),
          onPressed: () => {},
      )
    );
  }
}