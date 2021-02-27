import 'package:flutter/material.dart';

class Breed extends StatelessWidget {
  final items = ['Americano de Pelo Duro', 'Asiático', 'Azul Ruso', 'Bombay', 'Bengalí'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card( //                           <-- Card
          child: ListTile(
            title: Text(items[index]),
            trailing: Icon(
              Icons.delete,
              color: Colors.red.shade400,
            ),
          ),
        );
      },
    );
  }
}
