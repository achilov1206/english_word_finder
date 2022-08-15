import 'package:hive/hive.dart';

import '../models/theme_name.dart';

class ThemeDataHiveService {
  static const String dbKey = 'themeName';
  final Box<ThemeName> _themeData = Hive.box<ThemeName>('themedataname');
  ThemeDataHiveService() {
    init();
  }
  Future<void> init() async {
    if (_themeData.isEmpty) {
      ThemeName initialTheme = ThemeName(
        themeName: 'default',
      );
      _themeData.put(dbKey, initialTheme);
    }
  }

  void changeTheme(ThemeName themeData) {
    _themeData.put(dbKey, themeData);
  }

  ThemeName? getPrimeryTheme() {
    if (_themeData.containsKey(dbKey)) {
      return _themeData.get(dbKey);
    }
    return ThemeName(themeName: 'default');
  }
}
