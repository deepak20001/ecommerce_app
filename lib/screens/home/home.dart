import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';
import '../../models/product_model/product_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopTitles(title: "E Commerce", subtitle: ""),
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Search...."),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: categoriesList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(e),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  left: 12.0,
                ),
                child: Text(
                  "Best Products",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    // primary: false,
                    itemCount: bestProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) {
                      ProductModel singleProduct = bestProducts[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 209, 240),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12.0,
                            ),
                            Image.network(
                              singleProduct.image,
                              height: 80.0,
                              width: 100.0,
                            ),
                            Text(
                              singleProduct.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Price: \$${singleProduct.price}"),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 45.0,
                              width: 140.0,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Buy",
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://img.freepik.com/free-photo/dish-with-rice_144627-18096.jpg?w=900&t=st=1689247703~exp=1689248303~hmac=909248876b084056ae3b8b63e4da83d937b1b812a2a99ea3f2ac74ace239632c",
  "https://img.freepik.com/premium-photo/indian-lunch-dinner-main-course-food-group-includes-paneer-butter-masala-dal-makhani-palak-paneer-roti-rice-etc-selective-focus_466689-6854.jpg?size=626&ext=jpg",
  "https://img.freepik.com/premium-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-8576.jpg?size=626&ext=jpg",
  "https://img.freepik.com/free-photo/chicken-skewers-with-slices-sweet-peppers-dill_2829-18809.jpg?size=626&ext=jpg",
  "https://img.freepik.com/premium-photo/schezwan-noodles-vegetable-hakka-noodles-chow-mein-is-popular-indo-chinese-recipes-served-bowl-plate-with-wooden-chopsticks_466689-46487.jpg?size=626&ext=jpg",
];

List<ProductModel> bestProducts = [
  ProductModel(
    image:
        "https://static.vecteezy.com/system/resources/previews/008/848/350/original/fresh-yellow-banana-fruit-free-png.png",
    id: "1",
    name: "Banana",
    price: "1",
    description: "Hello this is good banana",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://www.forestessentialsindia.com/blog/wp-content/uploads/2020/02/mango-butter.png",
    id: "2",
    name: "Mango",
    price: "2",
    description: "Mango is awesome",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://www.applesfromny.com/wp-content/uploads/2020/05/20Ounce_NYAS-Apples2.png",
    id: "3",
    name: "Apple",
    price: "4",
    description: "This is apple. An apple a day keeps the doctor away.",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://amirthamnaturals.in/wp-content/uploads/2020/11/watermelon_PNG2650-600x326.png",
    id: "4",
    name: "Watermelon",
    price: "10",
    description:
        "Watermelon is a refreshing and juicy fruit with a high water content, typically red or pink in color with black seeds.",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://healthybuddha.in/image/cache/catalog/Guava2-500x515.png",
    id: "4",
    name: "Guava",
    price: "10",
    description: "This is guava.",
    status: "pending",
    isFavourite: false,
  ),
];
