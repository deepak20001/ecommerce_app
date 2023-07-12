import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/routes.dart';
import '../../home/home.dart';
import '../sign_up/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                title: "Login",
                subtitle: "Welcome Back To Ecommerce App",
              ),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                controller: email,
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
                controller: password,
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
                onPressed: () async {
                  bool isValidate = loginValidation(email.text, password.text);
                  if (isValidate == true) {
                    bool isLogined = await FirebaseAuthHepler.instance
                        .login(email.text, password.text, context);
                    if (isLogined == true) {
                      Routes.instance
                          .pushAndRemoveUntil(widget: Home(), context: context);
                    }
                  }
                },
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
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignUp(), context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
