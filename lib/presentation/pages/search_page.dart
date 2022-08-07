import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              const Text(
                'Search for any English word',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Visibility(
                visible: !isWordFound,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Word not found, Please check',
                    style: TextStyle(
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
                  hintText: 'Enter any word ',
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
                            wordToTranslate: _wordController.text,
                          ),
                        );
                  }
                },
                child: const Text(
                  'Search',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
