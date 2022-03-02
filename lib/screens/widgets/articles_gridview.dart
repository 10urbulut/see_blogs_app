import 'package:flutter/material.dart';

class ArticlesGridView extends StatelessWidget {
  const ArticlesGridView({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        mainAxisSpacing: 10,
        // shrinkWrap: true,
        children: list
            .map(
              (e) => Card(
                color: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("  article"),
                      VerticalDivider(),
                      Icon(Icons.heart_broken),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          height: 130,
                          width: 150,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  e + "   dsçdfngf sdfgnj reg reerghr herhgtrh etrhetrhkş ertşkhnrjteknhkjert erthnjr ekt   gpsıodfjhg ıpofdgsdfşl gsdfgs ddsf gsdf df gdf gdf ggfsdgioptrkopğ ğoeıwrutpilş ğıoruteshgjıoata",
                                  overflow: TextOverflow.fade,
                                  maxLines: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
            .toList());
  }
}
