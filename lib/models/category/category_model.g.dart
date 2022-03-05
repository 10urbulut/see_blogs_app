// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModelData _$CategoryModelDataFromJson(Map<String, dynamic> json) =>
    CategoryModelData(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'],
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelDataToJson(CategoryModelData instance) =>
    <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['Title'] as String?,
      image: json['Image'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Image': instance.image,
      'Id': instance.id,
    };
