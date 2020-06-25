# Flutter-Firebase-Auth
A new Flutter project.

Authentication: SignIn &amp; SignUp integrated with Firebase for Flutter.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## PART1
- Création de projet dans Firebase console en fournissant nom et applicationId du projet. (Ajouter un projet +)
- Intégration dans l'app du google-services.json file sous android/app. Enregistrement du fichier sous android/app/build.gradle.
- Enregistrement du SDK Flutter sous android/build.gradle (dependencies)
- Installation de librairie tier Flutter / Firebase : firebase_auth.
- Création d'usager dans Firebase Console - Authentication.
- Création d'une app flutter avec un app widget, login widget et home widget.
- Login widget permet de saisir et valider courriel & mot de passe.
- Appel au API de Firebase pour login.
- Intégration de routing au Home widget lors de login réussi.

Liens:
Firebase console: https://console.firebase.google.com/u/0/

FlutterFire (Flutter plugins that enable Flutter apps to use Firebase services)
You can follow an example that shows how to use these plugins in the Firebase for Flutter codelab :
https://codelabs.developers.google.com/codelabs/flutter-firebase/#0

Github of FlutterFire: https://github.com/FirebaseExtended/flutterfire

Examples of flutter plugins for firebase:
firebase_auth
Firebase plugins for Flutter : https://pub.dev/flutter/packages?q=firebase

## PART2

- In Main, change routing (home property) from LoginPage to WelcomePage.
- Create a new WelcomePage to hold actions: Sign In / Sign Up.
- SignIn button routes to the LoginPage built in PART1.
- SignUp button routes to a new SignUpPage which holds the creation of a Firebase user account.
- Route to SignUpPage to create a new account with email / password.
- After successful creation, it routes to the WelcomePage.
- User can then authenticate himself in the LoginPage as usual.
