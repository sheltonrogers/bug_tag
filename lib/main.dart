import 'dart:async';

import 'package:flutter/material.dart';

import 'pages/tag_bug.dart';
import 'util/bug.dart';
import 'util/database.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Bug> displayedBugs = [];

  Database _database = new Database();

  @override
  void initState() {
    super.initState();

    print("ADSFasdASDasd");
    _database.listenForBugs().listen((b) {
      print(b.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = new ListView.builder(
      itemBuilder: (BuildContext context, int index) => _makeElement(index),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tagged Bugs"),
      ),
      body: body,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _tagBug(),
        tooltip: 'Increment',
        child: new Icon(Icons.bug_report),
      ),
    );
  }

  _makeElement(index) {
    if (index >= displayedBugs.length) {
      if (index == 0) {
        // The user has no bugs, let them know
        return new ListTile(
          title: new Text("You haven't tagged any bugs yet..."),
        );
      }
      return null;
    }
    return new ListTile(
      title: new Text(displayedBugs[index].name)
    );
  }

  void _tagBug() {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) => new TagBugPage(),
    ));
  }
}

