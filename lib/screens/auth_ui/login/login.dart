import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/asset_images.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight + 12,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Buy any item from here ",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
