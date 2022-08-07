import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/theme_data.dart' as themedata_model;
import '../../services/theme_data_hive_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ChangeableThemeState> {
  final ThemeDataHiveService themeDataHiveService;
  ThemeCubit(this.themeDataHiveService)
      : super(ChangeableThemeState(
          themeData: themeDataHiveService.getThemePrimaryColor(),
        ));

  void changeThemePrimaryColor(Color color) {
    emit(
      state.copyWith(
        themeData: themedata_model.ThemeData(primaryColor: color),
      ),
    );
  }
}
