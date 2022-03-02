import 'package:http/http.dart';
import 'package:see_blogs_app/core/base_service.dart';
import 'package:see_blogs_app/models/auth_model/sign_in/sign_in.dart';

class AuthService extends BaseService<AuthService> {
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  Future<Response> signIn(SignIn signIn) async {
    Response response = await BaseService.post(path: "Login/SignIn", model: signIn);

    return response;
  }

  Future<Response> signUp(SignIn signIn) async {
    Response response = await BaseService.post(path: "Login/SignUp", model: signIn);

    return response;
  }
}
