import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/translation.dart';
import '../../repositories/translation_repository.dart';

part 'translations_event.dart';
part 'translations_state.dart';

class TranslationsBloc extends Bloc<TranslationsEvent, TranslationsState> {
  final TranslationRepository translationRepository;
  TranslationsBloc(this.translationRepository)
      : super(TranslationsState.initial()) {
    on<LoadTranslationsEvent>(
      (event, emit) {
        emit(state.copyWith(translationsStatus: TranslationsStatus.loading));
        try {
          List<Translation> allTranslations =
              translationRepository.getAllTransaltions();
          if (allTranslations.isEmpty) {
            return emit(
              state.copyWith(translationsStatus: TranslationsStatus.empty),
            );
          } else {
            return emit(
              state.copyWith(
                translationsStatus: TranslationsStatus.loaded,
                translations: allTranslations,
              ),
            );
          }
        } on CustomError catch (e) {
          return emit(
            state.copyWith(
              translationsStatus: TranslationsStatus.error,
              error: e,
            ),
          );
        }
      },
    );
    on<ToggleFavoriteTranslationEvent>(
      (event, emit) {
        translationRepository.toggleFavoriteTranslation(event.word);
      },
    );
    on<RemoveAllTranslations>((event, emit) {
      try {
        translationRepository.removeAllTranslations();
        emit(
          state.copyWith(translationsStatus: TranslationsStatus.empty),
        );
      } on CustomError catch (e) {
        print("error $e");
      }
    });
  }
}
