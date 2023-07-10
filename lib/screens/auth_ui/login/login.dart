import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
              title: "Login",
              subtitle: "Welcome back to Ecommerce App",
            ),
            const SizedBox(
              height: 46.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.password_sharp,
                ),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: isShowPassword == false
                      ? const Icon(
                          Icons.visibility,
                          color: Color(0xFFAA27FB),
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Color(0xFFAA27FB),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Center(
              child: Text("Don't have an account"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: CupertinoButton(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
