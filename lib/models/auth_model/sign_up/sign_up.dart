import 'package:json_annotation/json_annotation.dart';

part 'sign_up.g.dart';

@JsonSerializable()
class SignUp {
  SignUp({required this.email,required this.password, required this.passwordRetry});
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Password')
  String password;
  @JsonKey(name: 'PasswordRetry')
  String passwordRetry;
}
