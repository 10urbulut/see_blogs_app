import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignIn extends IBaseModel<SignIn> {
  SignIn({required this.email, required this.password});

  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Password')
  String password;

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  @override
  SignIn fromJson(Map<String, dynamic> json) {
    return SignIn.fromJson(json);
  }
}
