import 'package:flutter/material.dart';
import 'package:bug_tag/pages/tag_bug.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text("You haven't tagged any bugs yet..."),
        )
      ]
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

  void _tagBug() {
    // Navigator.of(context).push(new MaterialPageRoute(
    //   builder: (context) => new TagBugPage(),
    // ));
  }
}

