import 'package:flutter/material.dart';

class SynonymsAntonymsWidget extends StatelessWidget {
  final List wordList;
  const SynonymsAntonymsWidget({Key? key, required this.wordList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String wordListToText() {
      String text = '';
      for (String word in wordList) {
        text += '$word; ';
      }
      return text;
    }

    return Row(
      children: [
        const Text(
          'Antonyms: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            wordListToText(),
            softWrap: true,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
