import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';
part 'blog_model.g.dart';

@JsonSerializable()
class BlogModelData extends IBaseModel<BlogModelData> {
  BlogModelData({
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
  String? message;
  @JsonKey(name: 'Data')
  List<BlogModel>? data;

  factory BlogModelData.fromJson(Map<String, dynamic> json) =>
      _$BlogModelDataFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlogModelDataToJson(this);

  @override
  BlogModelData fromJson(Map<String, dynamic> json) {
    return BlogModelData.fromJson(json);
  }
}

@JsonSerializable()
class BlogModel extends IBaseModel<BlogModel> {
  BlogModel({
    this.title,
    this.content,
    this.image,
    this.categoryId,
    this.id,
  });
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Content')
  String? content;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'CategoryId')
  String? categoryId;
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(ignore: true)
  bool ?isFavorite;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);

  @override
  BlogModel fromJson(Map<String, dynamic> json) {
    return BlogModel.fromJson(json);
  }
}
