import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/datetime_helper.dart';
import '../../models/translation.dart';
import '../pages/search_result_page.dart';

class CustomListTile extends StatelessWidget {
  final Translation translation;
  const CustomListTile({Key? key, required this.translation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ListTile(
        title: Center(
          child: Text(
            translation.word.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        subtitle: Center(
          child: RichText(
            text: TextSpan(
              text: AppLocalizations.of(context).firstSearchTime,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: DateTimeHelper.dateFormatMMMEd(translation.dateTime!),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        tileColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            SearchResultPage.routeName,
            arguments: translation,
          );
        },
      ),
    );
  }
}
