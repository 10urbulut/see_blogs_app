import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModelData extends IBaseModel<CategoryModelData> {
  CategoryModelData({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  @JsonKey(name: 'ValidationErrors')
  List<dynamic>? validationErrors;
  @JsonKey(name: 'HasError')
  bool? hasError;
  @JsonKey(name: 'Message')
  dynamic message;
  @JsonKey(name: 'Data')
  List<CategoryModel>? data;
  factory CategoryModelData.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelDataFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryModelDataToJson(this);

  @override
  CategoryModelData fromJson(Map<String, dynamic> json) {
    return CategoryModelData.fromJson(json);
  }
}

@JsonSerializable()
class CategoryModel extends IBaseModel<CategoryModel> {
  CategoryModel({
    this.title,
    this.image,
    this.id,
  });

  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'Id')
  String? id;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }
}
