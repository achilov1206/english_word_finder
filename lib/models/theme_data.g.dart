// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeDataAdapter extends TypeAdapter<ThemeData> {
  @override
  final int typeId = 1;

  @override
  ThemeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeData(
      primaryColor: fields[0] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.primaryColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
