// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenHiveModelAdapter extends TypeAdapter<TokenHiveModel> {
  @override
  final int typeId = 0;

  @override
  TokenHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenHiveModel(
      token: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
