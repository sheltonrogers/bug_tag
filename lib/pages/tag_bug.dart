import 'package:flutter/material.dart';

import '../util/bug.dart';

class TagBugPage extends StatefulWidget {
  @override
  _TagBugPageState createState() => new _TagBugPageState();
}

class _TagBugPageState extends State<TagBugPage> {
  final _formKey = GlobalKey<FormState>();

  Bug _inputBug = new Bug();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            onPressed: _finishTag,
            icon: new Icon(Icons.send),
          )
        ]
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (String bugName) { _inputBug.name = bugName; },
                  ),
                ]
            )),
      )
    );
  }

  void _finishTag() {
    _formKey.currentState.save();
    print(_inputBug.name);
    Navigator.of(context).pop();
  }
}