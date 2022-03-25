import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/constants/enums.dart';
import 'package:see_blogs_app/constants/strings/text_strings.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/in_widgets/loading_widget.dart';
import 'package:see_blogs_app/screens/common_widgets/articles_gridview.dart';

import 'package:see_blogs_app/screens/common_widgets/bottom_navitaion_bar_with_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BlogManager>().getCategories;
    context.read<BlogManager>().blogs.isNotEmpty
        ? null
        : context.read<BlogManager>().getBlogsWithCategoryId().then((value) =>
            value.isEmpty
                ? Navigator.pushReplacementNamed(context, NamedRoutes.SIGN_IN)
                : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(TitleStrings.HOME),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CategoryTagsTopBody(),
              const BlogTextMiddleBody(),
              Expanded(
                  child: ArticlesGridView(
                blogForlist: BlogForList.Normal,
              )),
            ]),
        bottomNavigationBar: BottomNavigationBarWithItems());
  }
}

class CategoryTagsTopBody extends StatelessWidget {
  const CategoryTagsTopBody({
    Key? key,
  }) : super(key: key);

  final double dividerHeight = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: context
              .watch<BlogManager>()
              .categories
              .map(
                (e) => GestureDetector(
                  onTap: () async {
                    LoadingWidget.getLoadingCircularDialog(context: context);
                    await context
                        .read<BlogManager>()
                        .getBlogsWithCategoryId(categoryId: e.id.toString());
                    Navigator.pop(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          e.image.toString(),
                          height: 90,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        e.title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(height: dividerHeight)
                    ]),
                  ),
                ),
              )
              .toList()),
    );
  }
}

class BlogTextMiddleBody extends StatelessWidget {
  const BlogTextMiddleBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text(
          TextStrings.BLOG,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
            bottom: MediaQuery.of(context).size.height / 99,
            top: MediaQuery.of(context).size.height / 90));
  }
}
