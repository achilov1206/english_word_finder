import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:word_finder/repositories/translation_repository.dart';
import '../../models/custom_error.dart';
import '../../models/translation.dart';

part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  final TranslationRepository translationRepository;
  TranslationBloc(this.translationRepository)
      : super(TranslationState.initial()) {
    on<LoadTranslationEvent>(getTranslation);
  }

  Future<void> getTranslation(event, emit) async {
    emit(state.copyWith(translationStatus: TranslationStatus.loading));
    Translation? translation;
    try {
      translation = await translationRepository
          .getTranslation(event.wordToTranslate as String);
      if (translation == null) {
        return emit(
          state.copyWith(
            translationStatus: TranslationStatus.error,
          ),
        );
      }
      return emit(state.copyWith(
        translation: translation,
        translationStatus: TranslationStatus.loaded,
      ));
    } on CustomError catch (e) {
      return emit(state.copyWith(
        translationStatus: TranslationStatus.error,
        error: e,
      ));
    }
  }
}
