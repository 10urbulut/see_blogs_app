// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class AuthManager extends ChangeNotifier {
  late String _email;
  set setEmail(String value) => _email = value;
  late String _password;
  set setPassword(String value) => _password = value;
  late String _rePassword;
  set setRePassword(String value) => _rePassword = value;

  // Future<Response> signUp() async {

  //   Response response;

  //   return response;
  // }
}
