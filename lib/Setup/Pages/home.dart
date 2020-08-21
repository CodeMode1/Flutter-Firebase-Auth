import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  // @required keyword indicates constructor must include argument.
  const Home({Key key, @required this.user}) : super(key: key);

  // Gets passed by the ctr.
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Because is a stateful widget need to access user on widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.user.email}"),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("users")
                .document(widget.user.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> asyncSnapshot) {
              if (asyncSnapshot.hasError) {
                return Text("Error: ${asyncSnapshot.error}");
              }
              switch (asyncSnapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text(
                      "Connected to an asynchronous op and waiting interation.");
                case ConnectionState.none:
                  return Text("Could not connect to a valid store.");
                default:
                  return checkRole(asyncSnapshot.data);
              }
            }));
  }

  Row checkRole(DocumentSnapshot snapshot) {
    // TODO: At signup, push the new user to the users collection with default role
    // TODO: to fix the bug at runtime after creating and login new user (users collection mapping to firebase users).
    if (snapshot.data['role'] == 'admin') {
      return adminPage(snapshot);
    } else {
      return userPage(snapshot);
    }
  }

  Row adminPage(DocumentSnapshot snapshot) {
    return Row(children: <Widget>[
      Text('Role: ${snapshot.data['role']}'),
      Text('UserName: ${snapshot.data['name']}')
    ]);
  }

  Row userPage(DocumentSnapshot snapshot) {
    return Row(children: <Widget>[Text('UserName: ${snapshot.data['name']}')]);
  }
}
