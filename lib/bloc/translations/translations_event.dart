part of 'translations_bloc.dart';

abstract class TranslationsEvent extends Equatable {
  const TranslationsEvent();

  @override
  List<Object> get props => [];
}

class LoadTranslationsEvent extends TranslationsEvent {}

class ToggleFavoriteTranslationEvent extends TranslationsEvent {
  final String word;
  const ToggleFavoriteTranslationEvent({
    required this.word,
  });

  @override
  List<Object> get props => [word];
}

class RemoveAllTranslations extends TranslationsEvent {}
