import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/translations/translations_bloc.dart';

import '../widgets/block_color_picker.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
                        title: const Text('Please confirm'),
                        content: const Text(
                            'Are you sure you want to delete all saved entries?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<TranslationsBloc>()
                                  .add(RemoveAllTranslations());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('All saved entries deleted'),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Delete saved entries'),
            ),
          ],
        ),
      ),
    );
  }
}
