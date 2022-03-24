import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:see_blogs_app/core/base_service.dart';
import 'package:see_blogs_app/environment.dart';
import 'package:see_blogs_app/models/auth_model/sign_in/sign_in.dart';
import 'package:see_blogs_app/models/auth_model/sign_up/sign_up.dart';
import 'package:see_blogs_app/models/login_model_data/login_model_data.dart';

class LogInService extends BaseService<LogInService> {
  static final LogInService _singleton = LogInService._internal();
  factory LogInService() {
    return _singleton;
  }
  LogInService._internal();

  Future<LogInModelData> signIn(SignInModel signIn) async {
    Response response =
        await BaseService.post(path: "Login/SignIn", model: signIn);
    LogInModelData signInModelData =
        LogInModelData.fromJson(jsonDecode(response.body));
    responseAndTokenRegisteringOperations(signInModelData);
    return signInModelData;
  }

  Future<LogInModelData> signUp(SignUpModel signUp) async {
    Response response =
        await BaseService.post(path: "Login/SignUp", model: signUp);
    LogInModelData signUpModelData =
        BaseService.jsonBodyParser(LogInModelData(), response.body);
    responseAndTokenRegisteringOperations(signUpModelData);

    return signUpModelData;
  }

  Future<String> responseAndTokenRegisteringOperations(
      LogInModelData signInModelData) async {
    Hive.initFlutter('hive');
    var box = await Hive.openBox('token');
    if (signInModelData.hasError == false) {
      box.put('jwt', signInModelData.data?.token.toString());
      Environment.token = box.get('jwt').toString();
    }
    return Environment.token;
  }
}
