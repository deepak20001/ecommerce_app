import 'package:ecommerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 120.0,
                  ),
                  const Text(
                    "Deepak",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "deepak@gmail.com",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    width: 130.0,
                    child: PrimaryButton(
                      onPressed: () {},
                      title: "Edit Profile",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.shopping_bag_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.favorite_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text("Favourite"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.info_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text("About us"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.support_agent_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuthHepler.instance.signOut();
                      setState(() {});
                    },
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: const Text("Log out"),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text("Version 1.0.0"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
