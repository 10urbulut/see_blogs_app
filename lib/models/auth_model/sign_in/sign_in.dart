import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';

part 'sign_in.g.dart';


@JsonSerializable()
class SignInModel extends IBaseModel<SignInModel> {
  SignInModel({required this.email, required this.password});

  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Password')
  String password;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  @override
  SignInModel fromJson(Map<String, dynamic> json) {
    return SignInModel.fromJson(json);
  }
}
