// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModelData _$BlogModelDataFromJson(Map<String, dynamic> json) =>
    BlogModelData(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'] as String?,
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogModelDataToJson(BlogModelData instance) =>
    <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      title: json['Title'] as String?,
      content: json['Content'] as String?,
      image: json['Image'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Content': instance.content,
      'Image': instance.image,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
    };
