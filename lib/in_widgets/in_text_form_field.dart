// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InTextFormField extends StatelessWidget {
  InTextFormField({
    Key? key,
    this.label,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.obscureText,
    this.validator,
    this.keyboardType,
  }) : super(key: key);
  Widget? label;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  Widget? icon;
  TextInputType? keyboardType;

  TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          icon: icon,
          label: label,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
