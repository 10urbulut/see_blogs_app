// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModelData _$AccountModelDataFromJson(Map<String, dynamic> json) =>
    AccountModelData(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'] as String?,
      data: json['Data'] == null
          ? null
          : AccountModel.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountModelDataToJson(AccountModelData instance) =>
    <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['Id'] as String?,
      email: json['Email'] as String?,
      image: json['Image'] as String?,
      location: json['Location'] == null
          ? null
          : LocationModel.fromJson(json['Location'] as Map<String, dynamic>),
      favoriteBlogIds: (json['FavoriteBlogIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'Image': instance.image,
      'Location': instance.location,
      'FavoriteBlogIds': instance.favoriteBlogIds,
    };
