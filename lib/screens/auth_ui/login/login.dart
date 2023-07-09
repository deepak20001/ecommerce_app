import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome"),
          const SizedBox(
            height: 12,
          ),
          const Text("Buy any item from here"),
          Image.asset("assets/images/welcome.png"),
        ],
      ),
    );
  }
}
