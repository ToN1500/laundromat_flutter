// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favpoke_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavpokeModelAdapter extends TypeAdapter<FavpokeModel> {
  @override
  final int typeId = 0;

  @override
  FavpokeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavpokeModel(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavpokeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavpokeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
