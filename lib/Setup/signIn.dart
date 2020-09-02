import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skeleton_app/Setup/Pages/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Underscore mark fields as private in Dart.
  String _email, _password; // flutteruser@test.ca - Test123*
  // Key to use as a unique identifier key in the form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Form(
        // Form unique key identifier.
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return "Please type an email";
                }
                if (!input.contains("@")) {
                  return "Please type a valid email";
                }
                return null;
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return "Your password needs to be at least 6 characters";
                }
                return null;
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: "Password"),
              // Have the dots formatting characters.
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () => signIn(),
              child: Text("Sign in"),
            ),
          ], // <widget>[]
        ), // Column
      ), // Form
    );
  }

  // Sign in to Firebase.
  Future<void> signIn() async {
    // Retrieve the unique identifier of the form.
    final formState = _formKey.currentState;
    // Validate all form fields of form and returns true if no errors.
    if (formState.validate()) {
      // Saves every field of the form.
      formState.save();
      try {
        UserCredential res = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        var user = res.user;
        print("try");
        // Navigate to home widget upon succesful login.
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
