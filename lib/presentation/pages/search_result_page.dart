import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/translations/translations_bloc.dart';

import '../../models/translation.dart';
import '../widgets/custom_audio_player.dart';
import '../widgets/favorite_button.dart';
import '../widgets/part_of_speech_widget.dart';
import '../widgets/synonyms_antonyms_widget.dart';

class SearchResultPage extends StatelessWidget {
  static const routeName = '/search-result';
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Translation translation =
        ModalRoute.of(context)!.settings.arguments as Translation;

    return Scaffold(
      appBar: AppBar(
        title: Text(translation.word),
        actions: [
          FavoriteButton(
            isFavorite: translation.isFavorite ?? false,
            color: Colors.white,
            onStatusChanged: () {
              context.read<TranslationsBloc>().add(
                    ToggleFavoriteTranslationEvent(word: translation.word),
                  );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Translation word
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    translation.word.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              //Phonetics
              if (translation.phonetics != null)
                ...translation.phonetics!.map(
                  (phonetic) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (phonetic['text'] != null)
                            Text(
                              phonetic['text'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          if (phonetic['text'] != null &&
                              phonetic['audio'].isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: CustomAudioPlayer(url: phonetic['audio']),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              if (translation.origin != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Origin: ${translation.origin}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              //Meanings
              if (translation.meanings != null)
                ...translation.meanings!.map(
                  (meaning) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //partOfSpeech
                          if (meaning['partOfSpeech'] != null &&
                              meaning['partOfSpeech'].isNotEmpty)
                            PartOfSpeechWidget(
                              partOfSpeech: meaning['partOfSpeech'],
                            ),

                          //definitions
                          if (meaning['definitions'] != null &&
                              meaning['definitions'].isNotEmpty)
                            ...meaning['definitions'].map(
                              (defination) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 0),
                                        child: Text(
                                          defination['definition'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      if (defination['example'] != null &&
                                          defination['example'].isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            defination['example'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          if (meaning['synonyms'] != null &&
                              meaning['synonyms'].isNotEmpty)
                            SynonymsAntonymsWidget(
                              wordList: meaning['synonyms'],
                              label: 'Synonyms',
                            ),
                          if (meaning['antonyms'] != null &&
                              meaning['antonyms'].isNotEmpty)
                            SynonymsAntonymsWidget(
                              wordList: meaning['antonyms'],
                              label: 'Antonyms',
                            ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
