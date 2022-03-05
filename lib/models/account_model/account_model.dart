import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';
import 'package:see_blogs_app/models/location_model/location_model.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModelData extends IBaseModel<AccountModelData> {
  AccountModelData({
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
  AccountModel? data;

  factory AccountModelData.fromJson(Map<String, dynamic> json) =>
      _$AccountModelDataFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountModelDataToJson(this);

  @override
  AccountModelData fromJson(Map<String, dynamic> json) {
    return AccountModelData.fromJson(json);
  }
}

@JsonSerializable()
class AccountModel extends IBaseModel<AccountModel> {
  AccountModel({
    this.id,
    this.email,
    this.image,
    this.location,
    this.favoriteBlogIds,
  });

  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'Email')
  String? email;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'Location')
  LocationModel? location;
  @JsonKey(name: 'FavoriteBlogIds')
  List<String>? favoriteBlogIds;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  @override
  AccountModel fromJson(Map<String, dynamic> json) {
    return AccountModel.fromJson(json);
  }
}
