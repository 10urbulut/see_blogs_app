// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/constants/enums.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/models/blog_model/blog_model.dart';

class ArticlesGridView extends StatelessWidget {
  ArticlesGridView({Key? key, required this.blogForlist}) : super(key: key);
  BlogForList blogForlist;
  @override
  Widget build(BuildContext context) {
    return blogForlist == BlogForList.Normal
        ? GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 90,
                vertical: MediaQuery.of(context).size.height / 99),
            mainAxisSpacing: 10,
            children: context
                .watch<BlogManager>()
                .blogs
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      _TextAndIconFieldOfGridListElement(e: e),
                      _ImageFieldOfGridListElement(
                        e: e,
                      ),
                    ]),
                  ),
                )
                .toList())
        : GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 90,
                vertical: MediaQuery.of(context).size.height / 99),
            mainAxisSpacing: 10,
            children: context
                .watch<BlogManager>()
                .favoriteBlogs
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      _TextAndIconFieldOfGridListElement(e: e),
                      _ImageFieldOfGridListElement(
                        e: e,
                      ),
                    ]),
                  ),
                )
                .toList());
  }
}

class _TextAndIconFieldOfGridListElement extends StatelessWidget {
  _TextAndIconFieldOfGridListElement({Key? key, required this.e})
      : super(key: key);
  BlogModel e;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            e.title.toString(),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.favorite,
            size: 20,
            color: e.isFavorite == true ? Colors.black : Colors.grey,
          ),
          onTap: () {
            favoriteBlogOperations(context);
          },
        ),
      ],
    );
  }

  void favoriteBlogOperations(BuildContext context) {
    switch (e.isFavorite) {
      case true:
        e.isFavorite = false;
        context.read<BlogManager>().removeFavoriteBlogFromList(e);
        break;
      case false:
        e.isFavorite = true;
        context.read<BlogManager>().addFavoriteBlogToList(e);
        break;
      case null:
        e.isFavorite = true;
        context.read<BlogManager>().addFavoriteBlogToList(e);
        break;

      default:
    }
  }
}

class _ImageFieldOfGridListElement extends StatelessWidget {
  _ImageFieldOfGridListElement({Key? key, required this.e}) : super(key: key);
  BlogModel e;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<BlogManager>().setBlog = e;
        Navigator.pushNamed(context, NamedRoutes.ARTICLE_DETAIL);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(e.image.toString(),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 2.4,
                height: MediaQuery.of(context).size.height / 4.1),
          ),
        ],
      ),
    );
  }
}
