import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/translations/translations_bloc.dart';
import '../widgets/custom_list_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TranslationsBloc>().add(LoadTranslationsEvent());

    return BlocBuilder<TranslationsBloc, TranslationsState>(
      builder: (context, state) {
        context.read<TranslationsBloc>().add(LoadTranslationsEvent());
        if (state.translationsStatus == TranslationsStatus.empty) {
          return Text(AppLocalizations.of(context).searchSomeWord);
        } else if (state.translationsStatus == TranslationsStatus.loading) {
          return const CircularProgressIndicator();
        } else if (state.translationsStatus == TranslationsStatus.error) {
          return Text(AppLocalizations.of(context).errorUpdatePage);
        } else {
          return Column(
            children: [
              ...state.translations.map((item) {
                return CustomListTile(
                  translation: item,
                );
              }).toList(),
            ],
          );
        }
      },
    );
  }
}
