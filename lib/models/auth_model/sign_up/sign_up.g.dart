// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['Email'] as String,
      password: json['Password'] as String,
      passwordRetry: json['PasswordRetry'] as String,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'PasswordRetry': instance.passwordRetry,
    };
