// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class StripeHelper {
//   static StripeHelper instance = StripeHelper();

//   Map<String, dynamic>? paymentIntent;

//   Future<bool> makePayment(String amount) async {
//     try {
//       paymentIntent = await createPaymentIntent(amount, 'USD');

//       var gpay = const PaymentSheetGooglePay(
//           merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

// //STEP 2: Initialize Payment Sheet
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret: paymentIntent![
//                       'client_secret'], //Gotten from payment intent
//                   style: ThemeMode.light,
//                   merchantDisplayName: 'Deepak',
//                   googlePay: gpay))
//           .then((value) {});

// //STEP 3: Display Payment sheet
//       displayPaymentSheet();
//       return true;
//     } catch (err) {
//       print(err);
//       return false;
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         print("Payment Successfully");
//       });
//     } catch (e) {
//       print('$e');
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': amount,
//         'currency': currency,
//       };

//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization':
//               'Bearer sk_test_   Enter stripe secret key',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       return json.decode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }
// }
