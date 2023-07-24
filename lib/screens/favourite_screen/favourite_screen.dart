import 'package:ecommerce_app/screens/favourite_screen/widgets/single_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: appProvider.getFavouriteProductList.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (ctx, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              },
            ),
    );
  }
}
