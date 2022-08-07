// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'theme_data.g.dart';

@HiveType(typeId: 1)
class ThemeData extends HiveObject with EquatableMixin {
  @HiveField(0)
  Color primaryColor;
  ThemeData({
    required this.primaryColor,
  });

  @override
  List<Object?> get props => [primaryColor];

  ThemeData copyWith({
    Color? primaryColor,
  }) {
    return ThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }
}
