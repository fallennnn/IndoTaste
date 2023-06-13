import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text("Programmer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              accountEmail: Text(
                "dearprogrammer@etc.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
          ),


          //list tile
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.red,
            ),
            title: Text("Home", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          ),

          //list tile
          ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.red,
            ),
            title: Text("Pesanan", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}