import 'package:flutter/material.dart';
import 'package:see_blogs_app/screens/widgets/bottom_navitaion_bar_with_items.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
        actions: [
          ButtonBar(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.heart_broken))
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWithItems(),
    );
  }
}
