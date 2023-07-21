import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCartItem extends StatefulWidget {
  const SingleCartItem({super.key});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: const Color(0xFFAA27FB),
          width: 3.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: const Color.fromARGB(255, 204, 161, 231),
              child: Image.network(
                  "https://pngimg.com/uploads/usb/usb_PNG8834.png"),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Flash Drive",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                              child: const CircleAvatar(
                                maxRadius: 13.0,
                                child: Icon(Icons.remove_circle),
                              ),
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 72, 0, 117),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              child: const CircleAvatar(
                                maxRadius: 13.0,
                                child: Icon(Icons.add_circle),
                              ),
                            ),
                          ],
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: const Text(
                            "Add to wishlist",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "\$200",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
