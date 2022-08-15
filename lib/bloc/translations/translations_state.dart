part of 'translations_bloc.dart';

enum TranslationsStatus { initial, loading, loaded, error, empty }

class TranslationsState extends Equatable {
  final List<Translation> translations;
  final TranslationsStatus translationsStatus;
  final CustomError error;
  const TranslationsState({
    required this.translations,
    required this.translationsStatus,
    required this.error,
  });
  factory TranslationsState.initial() {
    return const TranslationsState(
      translations: [],
      translationsStatus: TranslationsStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object?> get props => [translations, translationsStatus, error];

  @override
  bool get stringify => true;

  TranslationsState copyWith({
    List<Translation>? translations,
    TranslationsStatus? translationsStatus,
    CustomError? error,
  }) {
    return TranslationsState(
      translations: translations ?? this.translations,
      translationsStatus: translationsStatus ?? this.translationsStatus,
      error: error ?? this.error,
    );
  }
}
