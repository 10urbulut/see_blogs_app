// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/constants/enums.dart';
import 'package:see_blogs_app/constants/strings/text_strings.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/screens/common_widgets/articles_gridview.dart';

import 'package:see_blogs_app/screens/common_widgets/bottom_navitaion_bar_with_items.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.MY_FAVORITES),
      ),
      body: context.watch<BlogManager>().favoriteBlogs.isEmpty
          ? const Center(
              child: Text(TextStrings.YOU_HAVE_NOT_ANY_FAVORITE_BLOG),
            )
          : ArticlesGridView(blogForlist: BlogForList.Favorites),
      bottomNavigationBar: BottomNavigationBarWithItems(),
    );
  }
}
