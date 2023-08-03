import 'package:ecommerce_app/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:ecommerce_app/screens/check_out/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../provider/app_provider.dart';
import '../../widgets/primary_button/primary_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              PrimaryButton(
                onPressed: () {
                  Routes.instance
                      .push(widget: const Checkout(), context: context);
                },
                title: "Checkout",
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
