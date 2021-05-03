import 'package:cats_weight_history/cat/bloc/cat_bloc.dart';
import 'package:cats_weight_history/cat/model/cat.dart';
import 'package:cats_weight_history/cat/ui/widget/cat_add_dialog.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final catBloc = CatBloc();

  @override
  void dispose() {
    catBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: catBloc.cats,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return (getCatCardWidget(snapshot));
            } else {
              return CircularProgressIndicator(); // Display a Circular Progress Indicator if the data is not fetched
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add, ),
          onPressed: () => showCatAddDialog(),
      )
    );
  }

  Widget getCatCardWidget(snapshot) {
    return snapshot.data.length != 0
        ? ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, itemPosition) {
        Cat cat = snapshot.data[itemPosition];
        return Card(
          child: ListTile(
            title: Text(cat.cat),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red.shade400,
              onPressed: () => {},
            ),
            onTap: () => {},
          ),
        );
      },
    )
        : Container(
        child: Center(
          child: Text(
            'Add some cat please.',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black54,
            ),
          ),
        ));
  }

  Future<dynamic> showCatAddDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CatAddDialog(catBloc: catBloc,);
        }
    );
  }
}