// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:see_blogs_app/models/auth_model/sign_in/sign_in.dart';
import 'package:see_blogs_app/models/auth_model/sign_up/sign_up.dart';
import 'package:see_blogs_app/models/login_model_data/login_model_data.dart';
import 'package:see_blogs_app/services/log_in_service.dart';

class LoginManager extends ChangeNotifier {
  final LogInService _service = LogInService();

  late String _email;
  set setEmail(String value) => _email = value;
  late String _password;
  set setPassword(String value) => _password = value;
  late String _rePassword;
  set setRePassword(String value) => _rePassword = value;

  Future<LogInModelData> signIn() async {
    var response =
        await _service.signIn(SignInModel(email: _email, password: _password));
    return response;
  }

  Future<LogInModelData> signUp() async {
    var response = await _service.signUp(SignUpModel(
        email: _email, passwordRetry: _rePassword, password: _password));
    return response;
  }
}
