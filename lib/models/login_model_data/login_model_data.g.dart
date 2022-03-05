// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInModelData _$LogInModelDataFromJson(Map<String, dynamic> json) =>
    LogInModelData(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'] as String?,
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogInModelDataToJson(LogInModelData instance) =>
    <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['Token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Token': instance.token,
    };
