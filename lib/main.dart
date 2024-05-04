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
   FirebaseFirestore.instance.settings = const Settings( persistenceEnabled: true
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RoteadorTela());
  }
}
class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context){
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(), builder: ((context, snapshot) {
      if (snapshot.hasData){
        return InicioTela();
      }else{
        return const LoginTela();
      }
    }),);
  }
}
