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
                padding: const EdgeInsets.all(12.0),
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ExpansionTile(
                      childrenPadding: EdgeInsets.zero,
                      tilePadding: EdgeInsets.zero,
                      collapsedShape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFAA27FB),
                        ),
                      ),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color((0xFFAA27FB)),
                        ),
                      ),
                      title: Row(
                        children: [
                          Container(
                            height: 155.0,
                            width: 155.0,
                            color: const Color.fromARGB(255, 204, 161, 231),
                            child: Image.network(
                              orderModel.products[0].image,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        orderModel.products[0].name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    orderModel.products.length > 1
                                        ? SizedBox.fromSize()
                                        : Column(
                                            children: [
                                              Text(
                                                "Quantity: ${orderModel.products[0].qty}",
                                                style: const TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12.0,
                                              ),
                                            ],
                                          ),
                                    Text(
                                      "Total Price: \$${orderModel.totalPrice.toString()}",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      "Order Status: ${orderModel.status}",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: orderModel.products.length > 1
                          ? [
                              const Text("Hello"),
                            ]
                          : [],
                    ),
                  );
                });
          }),
    );
  }
}
