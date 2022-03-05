// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';

class BottomNavigationBarWithItems extends StatefulWidget {
  static final BottomNavigationBarWithItems _singleton =
      BottomNavigationBarWithItems._internal();
  factory BottomNavigationBarWithItems() {
    return _singleton;
  }
  BottomNavigationBarWithItems._internal();

  @override
  State<BottomNavigationBarWithItems> createState() =>
      _BottomNavigationBarWithItemsState();
}

class _BottomNavigationBarWithItemsState
    extends State<BottomNavigationBarWithItems> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.black,
        iconSize: 25,
        onTap: (value) {
          onItemTapped(value);
          if (value == 0) {
            Navigator.pushReplacementNamed(context, NamedRoutes.HOME);
          }
          if (value == 1) {
            Navigator.pushReplacementNamed(context, NamedRoutes.FAVORITES);
          }
          if (value == 2) {
            Navigator.pushReplacementNamed(context, NamedRoutes.PROFILE);
          }
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite),
                    Text(
                        context.watch<BlogManager>().favoriteBlogs.isEmpty
                            ? ""
                            : context
                                .watch<BlogManager>()
                                .favoriteBlogs
                                .length
                                .toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                )
              ]),
              label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ]);
  }

  void onItemTapped(int index) {
    setState(() => (selectedIndex = index));
  }
}
