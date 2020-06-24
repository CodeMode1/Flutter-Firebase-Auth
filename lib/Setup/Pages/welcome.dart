import 'package:flutter/material.dart';
import 'package:skeleton_app/Setup/Pages/signUp.dart';
import 'package:skeleton_app/Setup/signIn.dart';

class WelcomePage extends StatefulWidget {

  final String signInTitle = "Sign In";
  final String signUpTitle = "Sign Up";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Firebase Flutter")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () => navigateToSignIn(),
              child: Text(widget.signInTitle),
            ),
          RaisedButton(
              onPressed: () => navigateToSignUp(),
              child: Text(widget.signUpTitle),
            )
        ],
      )
    );
  }

  void navigateToSignIn() {
    // Navigate to SignIn widget upon clicking "Sign In" button.
    // fullscreenDialog=true puts a X icon in the AppBar instead of <-- (back)
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: widget.signInTitle), fullscreenDialog: true));
  }

  void navigateToSignUp() {
    // Navigate to SignUp widget upon clicking "Sign Up" button.
    // fullscreenDialog=true puts a X icon in the AppBar instead of <-- (back)
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(title: widget.signUpTitle), fullscreenDialog: true));
  }
}