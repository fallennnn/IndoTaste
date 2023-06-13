import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indotaste/Widgets/CartWidgetApi.dart';
import '../../Components/default_button_custome_color.dart';
import '../../Widgets/CategoriesWidget.dart';
import '../../Widgets/NewestItemWidget.dart';
import '../../Widgets/PopularItemsWidget.dart';
import '../../Widgets/app_bar_widget.dart';
import '../../utils/constants.dart';
import '../BottomNavigation/BottomNavigation.dart';
import '../Discount/Discount.dart';

class CartScreens extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Discount()),
          );
        },
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(Icons.monetization_on_outlined),
        label: Text('Bayar Sekarang'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          //Popular items
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Keranjang",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          //Popular Item Widget
          SizedBox(
            height: 750,
            child: CartWidgetApi(),
          ),
        ],
      ),
    );
  }
}
