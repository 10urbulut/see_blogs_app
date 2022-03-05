// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/models/blog_model/blog_model.dart';
import 'package:see_blogs_app/screens/common_widgets/bottom_navitaion_bar_with_items.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogModel blog = context.read<BlogManager>().blog;
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.ARTICLE_DETAIL),
        actions: [
          ButtonBar(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
          )
        ],
      ),
      body: ListView(children: [
        const Divider(),
        _ArticleTitleField(blog: blog),
        const Divider(),
        _ArticleImageField(blog: blog),
        Row(children: [Html(data: blog.content)])
      ]),
      bottomNavigationBar: BottomNavigationBarWithItems(),
    );
  }
}

class _ArticleTitleField extends StatelessWidget {
  _ArticleTitleField({Key? key, required this.blog}) : super(key: key);
  BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        blog.title.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ]);
  }
}

class _ArticleImageField extends StatelessWidget {
  _ArticleImageField({Key? key, required this.blog}) : super(key: key);
  BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(blog.image.toString(),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 1.01),
        ),
      ],
    );
  }
}
