import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';

part 'sign_up.g.dart';

@JsonSerializable()
class SignUpModel extends IBaseModel<SignUpModel> {
  SignUpModel(
      {required this.email,
      required this.password,
      required this.passwordRetry});
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Password')
  String password;
  @JsonKey(name: 'PasswordRetry')
  String passwordRetry;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  @override
  SignUpModel fromJson(Map<String, dynamic> json) {
    return SignUpModel.fromJson(json);
  }
}
