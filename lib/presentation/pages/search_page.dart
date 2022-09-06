import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/translation/translation_bloc.dart';

import './search_result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _wordController = TextEditingController();
  bool isWordFound = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslationBloc, TranslationState>(
      listener: (context, state) {
        if (state.translationStatus == TranslationStatus.loaded) {
          isWordFound = true;
          Navigator.of(context).pushNamed(
            SearchResultPage.routeName,
            arguments: state.translation,
          );
        }
      },
      builder: (context, state) {
        if (state.translationStatus == TranslationStatus.error) {
          isWordFound = false;
        } else if (state.translationStatus == TranslationStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context).searchEnglishWord,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Visibility(
                visible: !isWordFound,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context).wordNotFound,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _wordController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).enterWord,
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_wordController.text.isNotEmpty) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    context.read<TranslationBloc>().add(
                          LoadTranslationEvent(
                            wordToTranslate: _wordController.text.trim(),
                          ),
                        );
                  }
                },
                child: Text(
                  AppLocalizations.of(context).search,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
