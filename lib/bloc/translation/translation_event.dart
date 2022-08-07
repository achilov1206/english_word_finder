// ignore_for_file: public_member_api_docs, sort_constructors_first
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

// class ToggleTranslationEvent extends TranslationEvent {
//   final Translation translation;
//   const ToggleTranslationEvent({
//     required this.translation,
//   });
//   @override
//   List<Object> get props => [translation];
// }
