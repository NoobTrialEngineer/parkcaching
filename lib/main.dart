import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parkcaching_v3/firebase_options.dart';
import 'package:parkcaching_v3/screen/login.dart';
import 'package:parkcaching_v3/screen/menu_screen.dart';
import 'package:parkcaching_v3/screen/qr_screen.dart';
import 'package:parkcaching_v3/screen/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkCaching',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

