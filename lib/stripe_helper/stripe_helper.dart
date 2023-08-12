// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import '../screens/custom_bottom_bar/custom_bottom_bar.dart';

class StripeHelper {
  static StripeHelper instance = StripeHelper();

  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(String amount, BuildContext context) async {
    try {
      int toRupee = int.parse(amount) * 74;
      amount = toRupee.toString();
      paymentIntent = await createPaymentIntent(amount, 'INR');

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "INR", currencyCode: "INR", testEnv: true);

//STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Deepak',
                  googlePay: gpay))
          .then((value) {});

//STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {}
  }

  displayPaymentSheet(BuildContext context) async {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        bool value =
            await FirebaseFirestoreHelper.instance.uploadOrderedProductFirebase(
          appProvider.getBuyProductList,
          context,
          "Paid",
        );

        appProvider.clearBuyProduct();

        if (value == true) {
          Future.delayed(
            const Duration(
              seconds: 2,
            ),
            () {
              Routes.instance
                  .push(widget: const CustomBottomBar(), context: context);
            },
          );
        }
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_ add secret key here'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
