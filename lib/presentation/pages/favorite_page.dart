import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/translations/translations_bloc.dart';
import '../../models/translation.dart';
import '../widgets/custom_list_tile.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationsBloc, TranslationsState>(
      builder: (context, state) {
        context.read<TranslationsBloc>().add(LoadTranslationsEvent());
        List<Translation> favoriteTranslation = [];
        if (state.translationsStatus == TranslationsStatus.loading) {
          return const CircularProgressIndicator();
        } else if (state.translationsStatus == TranslationsStatus.empty) {
          return Text(AppLocalizations.of(context).searchSomeWord);
        } else if (state.translationsStatus == TranslationsStatus.error) {
          return Text(AppLocalizations.of(context).errorUpdatePage);
        } else {
          favoriteTranslation = state.translations
              .where((translation) => translation.isFavorite == true)
              .toList();
          if (favoriteTranslation.isEmpty) {
            return Text(AppLocalizations.of(context).favoriteListEmpty);
          }
          return Column(
            children: [
              ...favoriteTranslation.map((item) {
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
