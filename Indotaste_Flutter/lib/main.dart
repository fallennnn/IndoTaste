import 'package:flutter/material.dart';
import 'package:indotaste/Screens/Login/LoginScreens.dart';
import 'package:indotaste/Screens/Home/HomeScreens.dart';
import 'package:indotaste/routes.dart';
import 'package:indotaste/theme.dart';

void main() async {
  runApp(MaterialApp(
      title: "Indotaste",
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
      debugShowCheckedModeBanner: false));
}
