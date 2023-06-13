import 'package:flutter/material.dart';
import 'package:indotaste/Widgets/info_card.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indotaste/Api/configAPI.dart';
import '../../Model/user.dart';

Future<List<User>> fetchProduct() async {
  final res = await http.get(Uri.parse(productURL));

  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    if (data != null && data.containsKey('listProduct')) {
      var parsed = data['user'].cast<Map<String, dynamic>>();
      var user = parsed.map<User>((json) => User.fromJson(json)).toList();
      return user.toList(); // Mengambil 6 data saja
    } else {
      throw Exception('Invalid data format');
    }
  } else {
    throw Exception('Failed');
  }
}

const Nama = "TulilJanko";
const Nomer = "085314145324";
const Email = "Tulil@gmail.com";

class ProfilePage extends StatelessWidget {
  static String routeName = "/profilepage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpeg'),
            ),
            Text(
              "Tuliljanko",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Pembeli",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            InfoCard(
                text: Nama, icon: Icons.account_box, onPressed: () async {}),
            InfoCard(text: Nomer, icon: Icons.add_call, onPressed: () async {}),
            InfoCard(
                text: Email,
                icon: Icons.email_outlined,
                onPressed: () async {}),
          ],
        ),
      ),
    );
  }
}
