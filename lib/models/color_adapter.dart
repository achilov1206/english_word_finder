import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    return Color(reader.readUint32());
  }

  @override
  int get typeId => 221;

  @override
  void write(BinaryWriter writer, Color obj) {
    return writer.writeUint32(obj.value);
  }
}
