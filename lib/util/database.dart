import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/helper.dart';
import '../util/bug.dart';

class Database {
  static final String _userColl = "users";
  static final String _bugColl = "bugs";

  CollectionReference _userBugCollection;

  Firestore _firestore;
  Database({Firestore firestore}) {
    if (firestore == null) {
      _firestore = Firestore.instance;
    } else {
      _firestore = firestore;
    }

    _userBugCollection = _firestore
        .collection(_userColl)
        .document(getUid())
        .collection(_bugColl);
  }

  void storeBug(Bug bug) async {
      _userBugCollection.add(bug.toMap());
  }

  Stream<Bug> listenForBugs() {
    return _userBugCollection.snapshots().expand((QuerySnapshot s) {
      s.documentChanges.map((DocumentChange c) {
        print("+++++1");
        Bug.fromMap(c.document.data);
        print("+++++2");
      });
    });
  }
}