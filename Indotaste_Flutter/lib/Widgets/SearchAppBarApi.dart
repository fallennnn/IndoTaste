import 'package:flutter/material.dart';
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Widgets/PopularItemsWidgetApi.dart';
import '../Model/products.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchAppBarApi extends StatefulWidget {
  @override
  _SearchAppBarApiState createState() => _SearchAppBarApiState();
}

Future<List<Product>> fetchProduct() async {
  final res = await http.get(Uri.parse(productURL));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['listProduct'].cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed');
  }
}

class _SearchAppBarApiState extends State<SearchAppBarApi> {
  TextEditingController _searchController = TextEditingController();
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              String searchText = _searchController.text;
              setState(() {
                products = fetchProduct().then((List<Product> productList) {
                  return productList
                      .where((product) => product.name
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList();
                });
              });
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'Tidak ada data',
                    style: TextStyle(color: Colors.teal, fontSize: 28),
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return Card(
                    child: InkWell(
                      child: Container(
                        width: 170,
                        height: 225,
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Image.network(
                                  product.image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                product.text,
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rp.${product.price}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white)),
                                    onPressed: () async {
                                      postData(
                                          1,
                                          snapshot.data![index].id,
                                          "2023-06-13",
                                          "0",
                                          1,
                                          int.parse(
                                              snapshot.data![index].price));
                                    },
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
