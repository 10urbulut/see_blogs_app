// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InButtonWhite extends StatelessWidget {
  InButtonWhite({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.height,
    this.width,
  }) : super(key: key);
  void Function()? onPressed;
  String label;
  IconData icon;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size(width ?? 300, height ?? 50),
      ),
      label: Text(label, textAlign: TextAlign.center),
      onPressed: onPressed,
    );
  }
}
