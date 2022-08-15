import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'theme_name.g.dart';

@HiveType(typeId: 1)
class ThemeName extends HiveObject with EquatableMixin {
  @HiveField(0)
  String themeName;
  ThemeName({
    required this.themeName,
  });

  @override
  List<Object?> get props => [themeName];

  ThemeName copyWith({
    String? themeName,
  }) {
    return ThemeName(
      themeName: themeName ?? this.themeName,
    );
  }
}
