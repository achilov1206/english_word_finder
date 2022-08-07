import 'package:hive/hive.dart';

import '../models/theme_data.dart' as themedata_model;

class ThemeDataHiveService {
  static const String dbKey = 'themePrimaryColor';
  late Box<themedata_model.ThemeData> _themeData;
  ThemeDataHiveService() {
    init();
  }
  Future<void> init() async {
    _themeData = Hive.box<themedata_model.ThemeData>('themedata');
  }

  void changeThemePrimaryColor(themedata_model.ThemeData themeData) {
    _themeData.put(dbKey, themeData);
  }

  themedata_model.ThemeData? getThemePrimaryColor() {
    return _themeData.get(dbKey);
  }
}
