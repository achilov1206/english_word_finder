import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/translations/translations_bloc.dart';

import '../widgets/block_color_picker.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BlockColorPickerWidget(),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context).confirm),
                        content: Text(
                          AppLocalizations.of(context).confirmDeleteAllMessage,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<TranslationsBloc>()
                                  .add(RemoveAllTranslations());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalizations.of(context)
                                      .allDeletedMessage),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context).yes),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context).no),
                          ),
                        ],
                      );
                    });
              },
              child: Text(AppLocalizations.of(context).deleteSaved),
            ),
          ],
        ),
      ),
    );
  }
}
