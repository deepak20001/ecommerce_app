import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Introducing [E-commerce App Name], your ultimate online shopping destination. We offer a vast selection of products from top brands, including electronics, fashion, home decor, beauty items, and more. With a user-friendly interface and secure checkout process, we ensure a seamless shopping experience. Our dedicated customer support team is always ready to assist you. Experience the joy of convenient online shopping with us. Join [E-commerce App Name] and explore endless possibilities. Happy shopping!",
          ),
        ),
      ),
    );
  }
}
