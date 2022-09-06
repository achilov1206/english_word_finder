import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/theme_name.dart';
import '../../services/theme_data_hive_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ChangeableThemeState> {
  final ThemeDataHiveService themeDataHiveService;
  ThemeCubit(this.themeDataHiveService)
      : super(
          ChangeableThemeState(
            themeName: themeDataHiveService.getPrimeryTheme(),
          ),
        );

  void changeTheme(String themeName) {
    themeDataHiveService.changeTheme(ThemeName(themeName: themeName));
    emit(
      state.copyWith(
        themeName: ThemeName(themeName: themeName),
      ),
    );
  }
}
