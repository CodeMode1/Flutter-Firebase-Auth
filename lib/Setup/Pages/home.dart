
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // @required keyword indicates constructor must include argument. 
  const Home({
    Key key,
    @required this.user
  }) : super(key: key);

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
    );
  }
}