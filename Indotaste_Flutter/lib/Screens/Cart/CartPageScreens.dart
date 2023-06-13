import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indotaste/Widgets/CartBottomNavBar.dart';
import 'package:indotaste/Widgets/CartWidgetApi.dart';
import 'package:indotaste/Widgets/DrawerWidget.dart';
import 'package:indotaste/Widgets/ReceiptWidget.dart';
import 'package:indotaste/Widgets/app_bar_widget.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/cartpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBarWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    bottom: 5,
                  ),
                  child: Text(
                    "Order List",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //item
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 30,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 450,
                  child: CartWidgetApi(),
                ),
                SizedBox(
                  height: 300,
                  child: ReceiptWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
