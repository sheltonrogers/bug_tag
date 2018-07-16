import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription<FirebaseUser> _listener;

  @override
  void initState() {
    super.initState();
    _finishWhenSignedIn();
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column();
    //return new SignInScreen(
    //  title: "Bienvenue",
    //  header: new Padding(
    //    padding: const EdgeInsets.symmetric(vertical: 32.0),
    //    child: new Padding(
    //      padding: const EdgeInsets.all(32.0),
    //      child: new Text("Demo"),
    //    ),
    //  ),
    //  providers: [
    //    ProvidersTypes.facebook,
    //    ProvidersTypes.google,
    //    ProvidersTypes.email
    //  ],
    //);
  }

  void _finishWhenSignedIn() async {
    _listener = _auth.onAuthStateChanged.listen((FirebaseUser user) {
      if (user != null ) {
        // Navigator.pop(context);
      }
    });
  }
}
