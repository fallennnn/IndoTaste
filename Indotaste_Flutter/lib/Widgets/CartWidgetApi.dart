import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Model/pesanans.dart';
import 'package:indotaste/Model/products.dart';

class CartWidgetApi extends StatefulWidget {
  CartWidgetApi({Key? key}) : super(key: key);

  @override
  State<CartWidgetApi> createState() => CartWidgetApiState();
}

class CartWidgetApiState extends State<CartWidgetApi> {
  late Future<List<Pesanan>> carts;
  List<dynamic>? products;

  @override
  void initState() {
    super.initState();
    carts = fetchCart();
    fetchProduct();
    refreshData();
  }

  Future<void> refreshData() async {
    await Future.wait([fetchCart(), fetchProduct()]);
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

  Future<void> fetchProduct() async {
    try {
      final response = await http.get(Uri.parse(productURL));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          products = jsonData['listProduct'];
        });
      } else {
        throw Exception('Failed to load additional data from the second API');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Pesanan>>(
        future: carts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Tidak ada pesanan',
                    style: TextStyle(color: Colors.teal, fontSize: 28)),
              );
            }
            return RefreshIndicator(
                onRefresh: refreshData,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data![index].user_id == 1) {
                      if (snapshot.data![index].status == "0") {
                        return Card(
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Container(
                                      width: 380,
                                      height: 150,
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              products?[snapshot.data![index]
                                                          .product_id -
                                                      1]['image'] ??
                                                  '',
                                              height: 80,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  products?[snapshot
                                                              .data![index]
                                                              .product_id -
                                                          1]['name'] ??
                                                      '',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  products![snapshot
                                                              .data![index]
                                                              .product_id -
                                                          1]['text'] ??
                                                      '',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  'Rp.${products![snapshot.data![index].product_id - 1]['price'] ?? ''}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.minus,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "1",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  Icon(
                                                    CupertinoIcons.minus,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
