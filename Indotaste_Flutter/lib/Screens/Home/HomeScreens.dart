import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indotaste/Widgets/PopularItemsWidgetApi.dart';

import '../../Widgets/CategoriesWidget.dart';
import '../../Widgets/NewestItemWidget.dart';
import '../../Widgets/PopularItemsWidget.dart';
import '../../Widgets/SearchWidgetButton.dart';
import '../../Widgets/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Search Widget
          SearchWidgetButton(),
          //Category
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Kategori",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          //Category Widget
          CategoriesWidget(),

          //Popular items
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Terlaris",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          //Popular Item Widget
          SizedBox(
            height: 250,
            child: PopularItemsWidgetApi(),
          ),

          //Popular items
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Terbaru",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          //Newest Item Widget
          // NewestItemWidget(),

          //Newest Item Widget
          SizedBox(
            height: 250,
            child: NewestItemWidget(),
          ),
        ],
      ),
    );
  }
}
