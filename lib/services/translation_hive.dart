import 'package:hive/hive.dart';
import 'package:word_finder/models/custom_error.dart';
import '../models/translation.dart';

class TranslationHiveService {
  late Box<Translation> _savedTranslations;

  TranslationHiveService() {
    init();
  }
  Future<void> init() async {
    _savedTranslations = Hive.box<Translation>('saved_translations');
  }

  List<Translation> getAllTransaltions() {
    final transaltions = _savedTranslations.values.toList();
    return transaltions;
  }

  Future<Translation?> getTranslation(String word) async {
    final int wordHashCode = word.toLowerCase().hashCode;
    final translation = _savedTranslations.get(wordHashCode);
    return Future.value(translation);
  }

  void toggleFavoriteTranslation(String word) {
    final int wordHashCode = word.toLowerCase().hashCode;

    if (_savedTranslations.containsKey(wordHashCode)) {
      final translation = _savedTranslations.get(wordHashCode);

      _savedTranslations.put(
        wordHashCode,
        translation!.copyWith(isFavorite: !translation.isFavorite!),
      );
    }
  }

  void addTranslation(Translation translation) {
    int wordHashCode = translation.word.toLowerCase().hashCode;
    if (!_savedTranslations.containsKey(wordHashCode)) {
      _savedTranslations.put(wordHashCode, translation);
    }
  }

  void removeAllTranslations() {
    try {
      _savedTranslations.clear();
    } catch (e) {
      CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'translation_hive/removeAllTranslations',
      );
    }
  }
}
