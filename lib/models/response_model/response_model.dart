import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel extends IBaseModel<ResponseModel> {
  ResponseModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic message;
  Data? data;
  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

  @override
  ResponseModel fromJson(Map<String, dynamic> json) {
    return ResponseModel.fromJson(json);
  }
}

@JsonSerializable()
class Data extends IBaseModel<Data> {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  Data fromJson(Map<String, dynamic> json) {
    return Data.fromJson(json);
  }
}
