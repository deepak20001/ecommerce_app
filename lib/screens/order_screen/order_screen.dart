import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/order_model/order_model.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestoreHelper.instance.getUserOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.isEmpty ||
                snapshot.data == null ||
                !snapshot.hasData) {
              return const Center(
                child: Text("No Order Found"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];
                  return ExpansionTile(
                    title: Text(
                      orderModel.payment,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          orderModel.status,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  );
                });
          }),
    );
  }
}
