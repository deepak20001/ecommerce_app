import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopTitles(
            title: "Welcome back to Ecommerce App",
            subtitle: "Login",
          ),
        ],
      ),
    );
  }
}
