import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:widgets_basic/sign_in/sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      theme: ThemeData.light(useMaterial3: true),
      home: SignInScreen(), // Replace with your desired screen/widget.
    );
  }
}