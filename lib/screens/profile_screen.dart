import 'package:flutter/material.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/screens/widgets/bottom_navitaion_bar_with_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.MY_PROFILE),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 40),
        children: [
          const Divider(),
          CircleAvatar(minRadius: 80, backgroundColor: Colors.black12),
          const Divider(),
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/smile.jpg',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              )),
          const Divider(),
          //TODO: button
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWithItems(),
    );
  }
}
