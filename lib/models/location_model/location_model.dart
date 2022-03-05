import 'package:json_annotation/json_annotation.dart';
import 'package:see_blogs_app/core/i_base_model.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends IBaseModel<LocationModel> {
  LocationModel({
    this.longtitude,
    this.latitude,
  });
  @JsonKey(name: 'Longtitude')
  String? longtitude;
  @JsonKey(name: 'Latitude')
  String? latitude;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel.fromJson(json);
  }
}
