import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import 'package:indotaste/Widgets/PopularItemsWidgetApi.dart';
import '../Model/products.dart';

class NewestItemWidget extends StatefulWidget {
  NewestItemWidget({Key? key}) : super(key: key);

  @override
  State<NewestItemWidget> createState() => NewestItemWidgetState();
}

Future<List<Product>> fetchProduct() async {
  final res = await http.get(Uri.parse(productURL));

  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    if (data != null && data.containsKey('listProduct')) {
      var parsed = data['listProduct'].cast<Map<String, dynamic>>();
      var products = parsed
          .map<Product>((json) => Product.fromJson(json))
          .toList()
          .reversed // Mengurutkan produk berdasarkan tanggal (diasumsikan tanggal terbaru ada di awal)
          .take(6) // Mengambil 6 produk teratas
          .toList();
      return products;
    } else {
      throw Exception('Invalid data format');
    }
  } else {
    throw Exception('Failed');
  }
}

// Future<List<Product>> fetchProduct() async {
//   final res = await http.get(Uri.parse(productURL));

//   if (res.statusCode == 200) {
//     var data = jsonDecode(res.body);
//     if (data != null && data.containsKey('listProduct')) {
//       var parsed = data['listProduct'].cast<Map<String, dynamic>>();
//       var products =
//           parsed.map<Product>((json) => Product.fromJson(json)).toList();
//       return products.take(6).toList(); // Mengambil 6 data saja
//     } else {
//       throw Exception('Invalid data format');
//     }
//   } else {
//     throw Exception('Failed');
//   }
// }

class NewestItemWidgetState extends State<NewestItemWidget> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Tidak ada data',
                    style: TextStyle(color: Colors.teal, fontSize: 28)),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
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
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              alignment: Alignment.center,
                              child: Image.network(
                                snapshot.data![index].image,
                                width: 125,
                                height: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              snapshot.data![index].text,
                              style: TextStyle(fontSize: 8),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rp.${snapshot.data![index].price}",
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
                                        int.parse(snapshot.data![index].price));
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
    );
  }
}
