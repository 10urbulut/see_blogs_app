// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InButtonColorful extends StatelessWidget {
  InButtonColorful(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.icon,
      this.height,
      this.width,
      this.backgroundColor})
      : super(key: key);
  void Function()? onPressed;
  String label;
  IconData icon;
  Color? backgroundColor;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blueGrey.shade800,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minimumSize: Size(width ?? 300, height ?? 50),
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
