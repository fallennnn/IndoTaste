import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import '../Model/products.dart';

class PopularItemsWidgetApi extends StatefulWidget {
  PopularItemsWidgetApi({Key? key}) : super(key: key);

  @override
  State<PopularItemsWidgetApi> createState() => PopularItemsWidgetApiState();
}

Future<List<Product>> fetchProduct() async {
  final res = await http.get(Uri.parse(productURL));

  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    if (data != null && data.containsKey('listProduct')) {
      var parsed = data['listProduct'].cast<Map<String, dynamic>>();
      var products =
          parsed.map<Product>((json) => Product.fromJson(json)).toList();
      return products.take(6).toList(); // Mengambil 6 data saja
    } else {
      throw Exception('Invalid data format');
    }
  } else {
    throw Exception('Failed');
  }
}

Future<void> postData(
    _user_id, _product_id, _tanggal, _status, _jumlah, _jumlah_harga) async {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  // Data yang ingin Anda kirim
  Map<String, dynamic> data = {
    "user_id": _user_id,
    "product_id": _product_id,
    "tanggal": _tanggal,
    "status": _status,
    "jumlah": _jumlah,
    "jumlah_harga": _jumlah_harga
  };

  print(data);
  String jsonBody = json.encode(data);

  try {
    http.Response response = await http.post(
      Uri.parse(addpesananURL),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      print('Data berhasil dikirim');
      print(response.body);
    } else {
      print('Gagal mengirim data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Terjadi kesalahan: $error');
  }
}

class PopularItemsWidgetApiState extends State<PopularItemsWidgetApi> {
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
                                  offset: Offset(0, 3))
                            ]),
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
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                snapshot.data![index].text,
                                style: TextStyle(
                                  fontSize: 8,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rp.${snapshot.data![index].price}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
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
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  );
                });
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
