part of 'translation_bloc.dart';

abstract class TranslationEvent extends Equatable {
  const TranslationEvent();

  @override
  List<Object> get props => [];
}

class LoadTranslationEvent extends TranslationEvent {
  final String wordToTranslate;
  const LoadTranslationEvent({
    required this.wordToTranslate,
  });
  @override
  List<Object> get props => [wordToTranslate];
}
