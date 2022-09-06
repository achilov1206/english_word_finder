import 'package:flutter/material.dart';

class SynonymsAntonymsWidget extends StatelessWidget {
  final List wordList;
  final String label;
  const SynonymsAntonymsWidget({
    Key? key,
    required this.wordList,
    required this.label,
  }) : super(key: key);

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
        Text(
          '$label: ',
          style: const TextStyle(
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
