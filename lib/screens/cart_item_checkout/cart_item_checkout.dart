// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:ecommerce_app/screens/custom_bottom_bar/custom_bottom_bar.dart';
// import 'package:ecommerce_app/stripe_helper/stripe_helper.dart';
import 'package:ecommerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/routes.dart';
import '../../provider/app_provider.dart';
import '../../stripe_helper/stripe_helper.dart';

class CartItemCheckout extends StatefulWidget {
  const CartItemCheckout({super.key});

  @override
  State<CartItemCheckout> createState() => _CartItemCheckoutState();
}

class _CartItemCheckoutState extends State<CartItemCheckout> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 36.0,
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  const Icon(Icons.money),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Cash on Delivery",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  const Icon(Icons.phone_android_sharp),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Pay Online",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            PrimaryButton(
              onPressed: () async {
                if (groupValue == 1) {
                  bool value = await FirebaseFirestoreHelper.instance
                      .uploadOrderedProductFirebase(
                    appProvider.getBuyProductList,
                    context,
                    "Cash on Delivery",
                  );

                  if (value == true) {
                    Future.delayed(
                      const Duration(
                        seconds: 2,
                      ),
                      () {
                        Routes.instance.push(
                            widget: const CustomBottomBar(), context: context);
                      },
                    );
                  }
                } else {
                  // bool isSuccessfullyPayment = true;
                  int value = double.parse(
                          appProvider.totalPriceBuyProductList().toString())
                      .round()
                      .toInt();
                  String totalPrice = (value * 100).toString();

                  await StripeHelper.instance
                      .makePayment(totalPrice.toString(), context);
                }
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
