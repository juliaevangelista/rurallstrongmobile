import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/login/login_tela.dart';
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
    return ScreenUtilInit(
      designSize: Size(375, 812), // Tamanho de design base (exemplo: iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rural Strong',
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: TextTheme(
              bodyText1: TextStyle(fontFamily: 'OpenSans', fontSize: 14.sp),
              bodyText2: TextStyle(fontFamily: 'OpenSans', fontSize: 12.sp),
              headline1: TextStyle(fontFamily: 'OpenSans', fontSize: 24.sp),
              headline2: TextStyle(fontFamily: 'OpenSans', fontSize: 22.sp),
              headline3: TextStyle(fontFamily: 'OpenSans', fontSize: 20.sp),
              headline4: TextStyle(fontFamily: 'OpenSans', fontSize: 18.sp),
              headline5: TextStyle(fontFamily: 'OpenSans', fontSize: 16.sp),
              headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 14.sp),
              subtitle1: TextStyle(fontFamily: 'OpenSans', fontSize: 16.sp),
              subtitle2: TextStyle(fontFamily: 'OpenSans', fontSize: 14.sp),
              caption: TextStyle(fontFamily: 'OpenSans', fontSize: 12.sp),
              button: TextStyle(fontFamily: 'OpenSans', fontSize: 14.sp),
              overline: TextStyle(fontFamily: 'OpenSans', fontSize: 10.sp),
            ),
          ),
          home: const RoteadorTela(),
        );
      },
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InicioTela();
        } else {
          return const LoginTela();
        }
      },
    );
  }
}
