// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/general_manager.dart';
import 'package:see_blogs_app/constants/strings/button_strings.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/in_widgets/in_button_colorful.dart';
import 'package:see_blogs_app/in_widgets/in_button_white.dart';
import 'package:see_blogs_app/in_widgets/loading_widget.dart';
import 'package:see_blogs_app/screens/common_widgets/are_you_sure_dialog.dart';
import 'package:see_blogs_app/screens/common_widgets/bottom_navitaion_bar_with_items.dart';
import 'package:see_blogs_app/screens/common_widgets/google_maps_view.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.MY_PROFILE),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AreYouSureDialog(
                              onPressed: () async =>
                                  logOutButtonOperations(context),
                            ));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 28,
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.aspectRatio / 0.01,
                backgroundImage: const AssetImage('assets/images/smile.jpg'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                alignment: Alignment.topCenter,
                icon: const Icon(Icons.add_a_photo),
                onPressed: () async {
                  await showPickerChooseDialog(context);
                  // showSelectedImage(context);
                },
              )
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 1.1,
                child: const GoogleMapsView(),
              )),
          const Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWithItems(),
    );
  }

  Future<void> showPickerChooseDialog(BuildContext context) async {
    const double _size = 35;

    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title:
                  const Text('Select a Picture', textAlign: TextAlign.center),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () async {
                          _image = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (_image != null) showSelectedImage(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: _size,
                        )),
                    IconButton(
                        onPressed: () async {
                          _image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (_image != null) showSelectedImage(context);
                        },
                        icon: const Icon(
                          Icons.photo_library,
                          size: _size,
                        ))
                  ],
                )
              ],
            ));
  }

  Future<void> showSelectedImage(BuildContext context) async {
    File _selectedImage = File(_image!.path);

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: false,
        enableDrag: true,
        constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height / 0.5),
        isDismissible: true,
        builder: (context) {
          return Column(
            children: [
              const Divider(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.file(_selectedImage,
                      scale: MediaQuery.of(context).size.aspectRatio / 0.1,
                      fit: BoxFit.contain),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InButtonColorful(
                      onPressed: () async {
                        LoadingWidget.getLoadingCircularDialog(
                            context: context);

                        var result = await context
                            .read<GeneralManager>()
                            .uploadFile(_selectedImage);

                        Navigator.pop(context);
                      },
                      label: ButtonStrings.SELECT,
                      height: 40,
                      width: 0,
                      icon: Icons.done_outline_rounded),
                  InButtonWhite(
                      onPressed: () => Navigator.pop(context),
                      label: ButtonStrings.REMOVE,
                      height: 40,
                      width: 0,
                      icon: Icons.remove_circle_outline)
                ],
              ),
            ],
          );
        });
  }

  Future<void> logOutButtonOperations(BuildContext context) async {
    var box = await Hive.openBox('token');
    box.put('jwt', '');
    box.close();
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, NamedRoutes.SIGN_IN);
  }
}
