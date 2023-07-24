import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text("Favourite"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.info_outline),
                    title: const Text("About us"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.support_agent_outlined),
                    title: const Text("Support"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.logout_outlined),
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
