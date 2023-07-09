import 'package:ecommerce_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'screens/auth_ui/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E Commerce",
      theme: themeData,
      home: const Login(),
    );
  }
}
