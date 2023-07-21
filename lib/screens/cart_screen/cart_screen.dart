import 'package:ecommerce_app/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (ctx, index) {
          return const SingleCartItem();
        },
      ),
    );
  }
}
