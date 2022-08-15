// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ChangeableThemeState extends Equatable {
  final ThemeName? themeName;
  const ChangeableThemeState({
    required this.themeName,
  });

  ChangeableThemeState copyWith({
    ThemeName? themeName,
  }) {
    return ChangeableThemeState(
      themeName: themeName ?? this.themeName,
    );
  }

  @override
  List<Object?> get props => [themeName];
}
