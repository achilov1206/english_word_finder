part of 'translation_bloc.dart';

enum TranslationStatus { initial, loading, loaded, error }

class TranslationState extends Equatable {
  final Translation translation;
  final TranslationStatus translationStatus;
  final CustomError error;
  const TranslationState({
    required this.translation,
    required this.translationStatus,
    required this.error,
  });
  factory TranslationState.initial() {
    return TranslationState(
      translation: Translation(word: 'smth'),
      translationStatus: TranslationStatus.initial,
      error: const CustomError(),
    );
  }

  @override
  List<Object?> get props => [translation, translationStatus, error];

  @override
  bool get stringify => true;

  TranslationState copyWith({
    Translation? translation,
    TranslationStatus? translationStatus,
    CustomError? error,
  }) {
    return TranslationState(
      translation: translation ?? this.translation,
      translationStatus: translationStatus ?? this.translationStatus,
      error: error ?? this.error,
    );
  }
}
