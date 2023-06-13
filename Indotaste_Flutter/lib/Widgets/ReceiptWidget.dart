import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Model/pesanans.dart';

class ReceiptWidget extends StatefulWidget {
  ReceiptWidget({Key? key}) : super(key: key);

  @override
  State<ReceiptWidget> createState() => ReceiptWidgetState();
}

class ReceiptWidgetState extends State<ReceiptWidget> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items:',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    items.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-total:',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Rp.${subTotal}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery:',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Rp.${delivery}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp.${subTotal + delivery}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
