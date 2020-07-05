// Dev says is own preference is to create a stateful widget.
// If then he doesn't need Stateful he will convert it to Stateless.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// State class. Holds the application state.
// Is immutable.
// A new instance of _SignUpState is created for each
// SignUp widget in the tree.
// Then _SignUpState holds the state too. 
//    _SignUpState is mutable: is the class manipulating, modifying the state.
//    Also rebuilds (repaints) the widget tree with the new state.
class SignUp extends StatefulWidget {
  SignUp({Key key, @required this.title}) : super(key: key);

  // Properties marked final
  final String title;

  // A new instance of _SignUpState is created for each
  // SignUp widget in the tree.
    @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    // Underscore mark fields as private in Dart.
  String _email, _password; // flutteruser@test.ca - Test123*
  // Key to use as a unique identifier key in the form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // State is held in private fields _myState
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
              decoration: InputDecoration(
                labelText: "Email"
              ),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return "Your password needs to be at least 6 characters";
                } 
                return null;
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: "Password"
              ),
              // Have the dots formatting characters.
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () => signUp(),
              child: Text("Create Account"),
            ),
          ], // <widget>[]
        ), // Column
      ), // Form
    );
  }

  // Signs up to Firebase.
  Future<void> signUp() async {
    // Retrieve the unique identifier of the form.
    final formState = _formKey.currentState;
    // Validate all form fields of form and returns true if no errors.
    if (formState.validate()) {
      // Saves every field of the form
      formState.save();
      try {
        print("try");

        // Creates user.
        AuthResult res = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        var user = res.user;
        user.sendEmailVerification(); // Initiates email verification for the user.
        // Navigate to home widget upon succesful login.
        // todo Display for the user that we sent an email.
        Navigator.of(context).pop();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(title: "Sign In"), fullscreenDialog: true)));
      } catch(e) {
        print(e.message);
      }
    }
  }
}