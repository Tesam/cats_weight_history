import 'package:cats_weight_history/breed/ui/screen/breed_screen.dart';
import 'package:cats_weight_history/cat/cat.dart';
import 'package:cats_weight_history/weight_history/weight_history.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats weight history',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget currentBody = Cat();
  String title = 'Cats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  'Cats Weight History',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: Text(
                  'Cats',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    currentBody = Cat();
                    title = 'Cats';
                  });
                },
              ),
              ListTile(
                title: Text(
                  'Weight History',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    currentBody = WeightHistory();
                    title = 'Weight History';
                  });
                },
              ),
              ListTile(
                title: Text(
                  'Breeds',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    currentBody = BreedScreen();
                    title = 'Breeds';
                  });
                },
              ),
            ],
          ),
        ),
        body: currentBody,
    );
  }
}
