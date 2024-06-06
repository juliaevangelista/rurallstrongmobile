import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/login_tela.dart';
import 'package:rurallstrong/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rural Strong',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'OpenSans'),
          bodyText2: TextStyle(fontFamily: 'OpenSans'),
          headline1: TextStyle(fontFamily: 'OpenSans'),
          headline2: TextStyle(fontFamily: 'OpenSans'),
          headline3: TextStyle(fontFamily: 'OpenSans'),
          headline4: TextStyle(fontFamily: 'OpenSans'),
          headline5: TextStyle(fontFamily: 'OpenSans'),
          headline6: TextStyle(fontFamily: 'OpenSans'),
          subtitle1: TextStyle(fontFamily: 'OpenSans'),
          subtitle2: TextStyle(fontFamily: 'OpenSans'),
          caption: TextStyle(fontFamily: 'OpenSans'),
          button: TextStyle(fontFamily: 'OpenSans'),
          overline: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      home: const RoteadorTela(),
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return InicioTela();
        } else {
          return const LoginTela();
        }
      }),
    );
  }
}
