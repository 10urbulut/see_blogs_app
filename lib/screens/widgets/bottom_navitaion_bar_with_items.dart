import 'package:flutter/material.dart';

class BottomNavigationBarWithItems extends StatelessWidget {
  const BottomNavigationBarWithItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(iconSize: 25, onTap: (value) {}, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
    ]);
  }
}
