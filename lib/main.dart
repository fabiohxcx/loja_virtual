import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/base_screen.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:loja_virtual/screens/signup_screen.dart';

import 'di.dart';

/// Requires that a Firestore emulator is running locally.
/// See https://firebase.flutter.dev/docs/firestore/usage#emulator-usage
bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings =
        const Settings(host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.indigo,
          appBarTheme: const AppBarTheme(elevation: 0)),
      initialRoute: BaseScreen.id,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case BaseScreen.id:
            return MaterialPageRoute(builder: (_) => BaseScreen());
          case LoginScreen.id:
            return MaterialPageRoute(builder: (_) => LoginScreen());
          case SignUpScreen.id:
            return MaterialPageRoute(builder: (_) => SignUpScreen());
          default:
            return MaterialPageRoute(builder: (_) => BaseScreen());
        }
      },
    );
  }
}
