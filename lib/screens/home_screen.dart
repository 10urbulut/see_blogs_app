import 'package:flutter/material.dart';
import 'package:see_blogs_app/screens/widgets/articles_gridview.dart';
import 'package:see_blogs_app/screens/widgets/bottom_navitaion_bar_with_items.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> list = ["Onur", "Buse", "Şahin", "Selami", "Sani", "Melda"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: list
                        .map(
                          (e) => Card(
                            color: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(children: [
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  VerticalDivider(),
                                  ClipRRect(
                                    child: SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          "dsçdfngf sdfgnj   gpsıodfjhg ıpofdgsdfşl gsdfgs ddsf gsdf df gdf gdf ggfsdgioptrkopğ ğoeıwrutpilş ğıoruteshgjıoata",
                                          overflow: TextOverflow.fade,
                                          maxLines: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                ],
                              ),
                              Text("Category Tag"),
                              const Divider()
                            ]),
                          ),
                        )
                        .toList()),
              ),
              Container(
                  child: Text("Blog"),
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10)),
              Expanded(
                child: ArticlesGridView(list: list),
              ),
            ]),
        bottomNavigationBar: const BottomNavigationBarWithItems());
  }
}


