import 'package:flutter/material.dart';
import 'package:indotaste/Screens/Discount/Discount.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Model/pesanans.dart';

class CartBottomNavBar extends StatefulWidget {
  CartBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CartBottomNavBar> createState() => CartBottomNavBarState();
}

class CartBottomNavBarState extends State<CartBottomNavBar> {
  late Future<List<Pesanan>> carts;
  List<dynamic>? products;
  int items = 0;
  int subTotal = 0;
  int delivery = 5000;

  @override
  void initState() {
    super.initState();
    carts = fetchCart();
    refreshData();
    calculateDataCount();
  }

  Future<void> refreshData() async {
    await Future.wait([fetchCart()]);
  }

  Future<List<Pesanan>> fetchCart() async {
    final res = await http.get(Uri.parse(pesananURL));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var parsed = data['listPesanan'].cast<Map<String, dynamic>>();
      return parsed.map<Pesanan>((json) => Pesanan.fromJson(json)).toList();
    } else {
      throw Exception('Failed');
    }
  }

  void calculateDataCount() {
    carts.then((listPesanan) {
      // Filter data dengan kondisi tertentu
      for (Pesanan pesanan in listPesanan) {
        if (pesanan.status == "0") {
          items += 1;
          subTotal += pesanan.jumlah_harga;
        }
      }

      setState(() {
        items;
        subTotal;
      });
      print('Jumlah data dengan kondisi tertentu: $items');
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\Rp.${subTotal + delivery}",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 6,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Discount()),
                    );
                  },
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
