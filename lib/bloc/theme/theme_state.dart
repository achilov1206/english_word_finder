// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ChangeableThemeState extends Equatable {
  final themedata_model.ThemeData? themeData;
  const ChangeableThemeState({
    required this.themeData,
  });

  ChangeableThemeState copyWith({
    themedata_model.ThemeData? themeData,
  }) {
    return ChangeableThemeState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [];
}
