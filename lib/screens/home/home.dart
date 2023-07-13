import 'package:ecommerce_app/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
        ],
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
