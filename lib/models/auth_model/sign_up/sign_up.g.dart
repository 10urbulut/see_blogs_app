// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      email: json['Email'] as String,
      password: json['Password'] as String,
      passwordRetry: json['PasswordRetry'] as String,
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'PasswordRetry': instance.passwordRetry,
    };
