import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                icon,
                color: Colors.black,
              ),
              title: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )));
  }
}
