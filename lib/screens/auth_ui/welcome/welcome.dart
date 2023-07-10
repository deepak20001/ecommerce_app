import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/asset_images.dart';
import '../../../constants/routes.dart';
import '../login/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                title: "Welcome", subtitle: "Buy any item using APP"),
            Center(
              child: Image.asset(AssetsImages.instance.welcomeImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsIcons.instance.facebookIcon,
                    scale: 12.0,
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsIcons.instance.googleIcon,
                    scale: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            PrimaryButton(
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
              title: "Login",
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              onPressed: () {},
              title: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
