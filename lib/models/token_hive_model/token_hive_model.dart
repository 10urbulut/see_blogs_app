import 'package:hive/hive.dart';

part 'token_hive_model.g.dart';

@HiveType(typeId: 0)
class TokenHiveModel extends HiveObject {
  TokenHiveModel({
    this.token,
  });
  @HiveField(0)
  String? token;
}
