import 'package:flutter/material.dart';
import 'package:indotaste/Screens/BottomNavigation/BottomNavigation.dart';
import 'package:indotaste/Screens/Login/LoginScreens.dart';
import 'package:indotaste/Screens/Profile/profile.dart';
import 'package:indotaste/Screens/Register/RegistrasiScreens.dart';
import 'package:indotaste/Screens/Cart/CartScreens.dart';
import 'package:indotaste/Screens/Discount/Discount.dart';
import 'Screens/Home/HomeScreens.dart';
import 'package:indotaste/Screens/Cart/CartPageScreens.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BottomNavigation.routeName: (context) => BottomNavigation(),
  CartScreens.routeName: (context) => CartScreens(),
  Discount.routeName: (context) => Discount(),
  CartPage.routeName: (context) => CartPage(),
  ProfilePage.routeName: (context) => ProfilePage()
};
