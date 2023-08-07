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
            return Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.all(12.0),
                  itemBuilder: (context, index) {
                    OrderModel orderModel = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        collapsedShape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFAA27FB),
                            width: 1.5,
                          ),
                        ),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFAA27FB),
                            width: 1.5,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  thickness: 1.0,
                                ),
                                const Text(
                                  "Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  thickness: 1.0,
                                ),
                                ...orderModel.products.map((singleProduct) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 6.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Container(
                                              height: 80.0,
                                              width: 80.0,
                                              color: const Color.fromARGB(
                                                  255, 204, 161, 231),
                                              child: Image.network(
                                                singleProduct.image,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 12.0,
                                                left: 12.0,
                                                right: 12.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Text(
                                                      singleProduct.name,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12.0,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Quantity: ${singleProduct.qty}",
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Price: \$${singleProduct.price.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ],
                                    ),
                                  );
                                }).toList()
                              ]
                            : [],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
