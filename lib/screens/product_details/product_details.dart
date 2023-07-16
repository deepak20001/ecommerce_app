import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product_model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.singleProduct.image,
              height: 300,
              width: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleProduct.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleProduct.isFavourite =
                          !widget.singleProduct.isFavourite;
                    });
                  },
                  icon: Icon(
                    widget.singleProduct.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: const Color(0xFFAA27FB),
                  ),
                ),
              ],
            ),
            Text(widget.singleProduct.description),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    if (qty >= 1) {
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove_circle,
                    size: 35.0,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  qty.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 72, 0, 117),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  child: const Icon(
                    Icons.add_circle,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("ADD TO CART"),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                SizedBox(
                  height: 38,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("BUY"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
