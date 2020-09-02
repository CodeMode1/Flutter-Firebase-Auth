import 'package:flutter/material.dart';
import 'package:skeleton_app/Setup/Pages/welcome.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  // Running an async function in main.
  // https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  // Running an async function in main.
  // https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    return MaterialApp(
      home: Scaffold(
        // https://stackoverflow.com/questions/58088030/using-futurebuilder-to-render-widgets-conditionally
        // https://stackoverflow.com/questions/50214338/flutter-error-mediaquery-of-called-with-a-context-that-does-not-contain-a-med
        body: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              // return SomethingWentWrong();
            }
            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return WelcomePage();
            }
            // Otherwise, show something whilst waiting for initialization to complete
            // return Loading();
            return WelcomePage();
          },
        ),
      ),
    );
  }
}
