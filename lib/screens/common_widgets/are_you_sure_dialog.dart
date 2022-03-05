// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:see_blogs_app/constants/strings/button_strings.dart';
import 'package:see_blogs_app/in_widgets/in_button_colorful.dart';
import 'package:see_blogs_app/in_widgets/in_button_white.dart';

class AreYouSureDialog extends StatelessWidget {
  AreYouSureDialog({
    Key? key,
    required this.onPressed,
    this.confirmButtonText,
    this.confirmButtonIcon,
    this.title,
  }) : super(key: key);
  void Function()? onPressed;
  String? confirmButtonText;
  String? title;
  IconData? confirmButtonIcon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Are you sure?'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InButtonWhite(
                onPressed: () => Navigator.pop(context),
                label: ButtonStrings.CANCEL,
                height: 35,
                width: 40,
                icon: Icons.cancel_outlined),
            InButtonColorful(
                onPressed: onPressed,
                backgroundColor: Colors.redAccent,
                label: confirmButtonText ?? ButtonStrings.YES,
                height: 35,
                width: 40,
                icon: confirmButtonIcon ?? Icons.check)
          ],
        )
      ],
    );
  }
}
