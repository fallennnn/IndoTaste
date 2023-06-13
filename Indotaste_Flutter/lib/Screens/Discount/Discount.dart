import 'package:flutter/material.dart';
import 'package:indotaste/Screens/Cart/CartScreens.dart';
import 'package:indotaste/Widgets/ReceiptWidget.dart';
import 'package:indotaste/Screens/Payment/Pembayaran.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Model/pesanans.dart';

class Discount extends StatelessWidget {
  static String routeName = "/discount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Diskon'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> list = <String>[
  'Tanpa Diskon - 0%',
  'Diskon 19/5/23 - 5%',
  'Diskon 20/5/23 - 6%',
  'Diskon 20/5/23 - 7%',
  'Diskon 20/5/23 - 8%'
];

class _HomePageState extends State<HomePage> {
  String dropdownValue = list.first;
  double diskon = 0;
  double totalSetelahDiskon = 0;

  late Future<List<Pesanan>> carts;
  List<dynamic>? products;
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
      for (Pesanan pesanan in listPesanan) {
        if (pesanan.status == "0") {
          subTotal += pesanan.jumlah_harga;
        }
      }

      setState(() {
        subTotal;
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void hitungTotalSetelahDiskon() {
    setState(() {
      totalSetelahDiskon =
          subTotal + delivery - ((subTotal + delivery) * (diskon / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReceiptWidget(),
              SizedBox(height: 16),
              Text(
                'Diskon :',
                style: TextStyle(fontSize: 20),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    diskon = double.parse(value[value.length - 2]);
                    hitungTotalSetelahDiskon();
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Total Setelah Diskon:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Rp.${totalSetelahDiskon.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: Text(
            'Lanjutkan',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pembayaran()),
            );
          },
        ),
      ),
    );
  }
}
