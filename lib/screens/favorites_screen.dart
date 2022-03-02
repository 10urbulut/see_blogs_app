import 'package:flutter/material.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/screens/widgets/articles_gridview.dart';
import 'package:see_blogs_app/screens/widgets/bottom_navitaion_bar_with_items.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  List<String> list = [
    "dgfd",
    "dfkngşsdfjng",
    "şfldkngdsfjşkl",
    "dsfkldngdsfklg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.MY_FAVORITES),
      ),
      body: ArticlesGridView(list: list),
      bottomNavigationBar: const BottomNavigationBarWithItems(),
    );
  }
}
