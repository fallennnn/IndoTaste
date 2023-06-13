import 'package:flutter/material.dart';

import 'CategoriesFoodApi.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(children: [
          buildCategoryItem(context, "Nasi", "assets/others/nasi.png", 1),
          buildCategoryItem(context, "Sate", "assets/others/sate.png", 2),
          buildCategoryItem(context, "Minuman", "assets/others/drink.png", 3),
          buildCategoryItem(context, "Pizza", "assets/others/pizza.png", 4),
          buildCategoryItem(context, "Burger", "assets/others/burger.png", 5),
          // for (int i = 0; i < 10; i++)
          //Single Item
        ]),
      ),
    );
  }

  Widget buildCategoryItem(
      BuildContext context, String categoryName, String imagePath, int idType) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoriesFoodApi(
                  categoryName: categoryName, idType: idType)),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: 8), // Tambahkan padding di sini
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
