import '../models/translation.dart';
import '../services/translation_api.dart';
import '../services/translation_hive.dart';

class TranslationRepository {
  final TranslationApiService translationApiService;
  final TranslationHiveService translationHiveService;
  const TranslationRepository({
    required this.translationApiService,
    required this.translationHiveService,
  });

  Future<Translation?> getTranslation(String word) async {
    Translation? savedTranslation =
        await translationHiveService.getTranslation(word);
    if (savedTranslation != null) {
      return savedTranslation;
    } else {
      Translation? newTranslation =
          await translationApiService.getTranslation(word);
      if (newTranslation != null) {
        translationHiveService.addTranslation(newTranslation);
      }
      return newTranslation;
    }
  }

  List<Translation> getAllTransaltions() {
    return translationHiveService.getAllTransaltions();
  }

  void toggleFavoriteTranslation(String word) {
    return translationHiveService.toggleFavoriteTranslation(word);
  }

  void removeAllTranslations() {
    return translationHiveService.removeAllTranslations();
  }
}
