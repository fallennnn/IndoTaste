// import 'package:flutter/material.dart';
// import '../Screens/Home/HomeScreens.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../Model/products.dart';

// class CategoriesFoodApi extends StatefulWidget {
//   CategoriesFoodApi({Key? key}) : super(key: key);

//   @override
//   State<CategoriesFoodApi> createState() => CategoriesFoodApiState();
// }

// Future<List<Product>> fetchProduct() async {
//   final res =
//       await http.get(Uri.parse('http://192.168.18.14:8000/api/product'));
//   if (res.statusCode == 200) {
//     var data = jsonDecode(res.body);
//     var parsed = data['list'].cast<Map<String, dynamic>>();
//     return parsed.map<Product>((json) => Product.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed');
//   }
// }

// class CategoriesFoodApiState extends State<CategoriesFoodApi> {
//   late Future<List<Product>> products;

//   @override
//   void initState() {
//     super.initState();
//     products = fetchProduct();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<List<Product>>(
//         future: products,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.isEmpty) {
//               return const Center(
//                 child: Text('Tidak ada data',
//                     style: TextStyle(color: Colors.teal, fontSize: 28)),
//               );
//             }
//             return ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: InkWell(
//                         child: Container(
//                       child: Container(
//                         width: 170,
//                         height: 225,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 3,
//                                   blurRadius: 10,
//                                   offset: Offset(0, 3))
//                             ]),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.all(15),
//                                 alignment: Alignment.center,
//                                 child: Image.network(
//                                   snapshot.data![index].image,
//                                   width: 125,
//                                   height: 125,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Text(
//                                 snapshot.data![index].name,
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text(
//                                 snapshot.data![index].text,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   // fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Rp.${snapshot.data![index].price}",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         color: Colors.red,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Icon(
//                                     Icons.shopping_cart,
//                                     color: Colors.red,
//                                     size: 25,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )),
//                   );
//                 });
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
