import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';
part 'login_model_data.g.dart';

@JsonSerializable()
class LogInModelData extends IBaseModel<LogInModelData> {
  LogInModelData({
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
  Data? data;

  factory LogInModelData.fromJson(Map<String, dynamic> json) =>
      _$LogInModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LogInModelDataToJson(this);

  @override
  LogInModelData fromJson(Map<String, dynamic> json) {
    return LogInModelData.fromJson(json);
  }
}

@JsonSerializable()
class Data extends IBaseModel<Data> {
  Data({
    this.token,
  });
@JsonKey(name: 'Token')
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  Data fromJson(Map<String, dynamic> json) {
    return Data.fromJson(json);
  }
}
