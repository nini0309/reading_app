import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/pages/book.dart';
import 'package:reading_app/pages/login.dart';
import 'package:reading_app/pages/register.dart';
import 'package:reading_app/pages/splash.dart';
import 'package:reading_app/pages/home.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'splash': (context) => Splash(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
