import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import './services/theme_data_hive_service.dart';

import './bloc/translation/translation_bloc.dart';
import './bloc/translations/translations_bloc.dart';
import './bloc/theme/theme_cubit.dart';
import './services/translation_api.dart';
import './services/translation_hive.dart';
import './models/translation.dart';
import './repositories/translation_repository.dart';
import './theme/main_theme.dart';

import 'models/theme_name.dart';

import './presentation/pages/app_page.dart';
import './presentation/pages/search_result_page.dart';
import './presentation/pages/settings_page.dart';
import './presentation/pages/about_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(TranslationAdapter());
  Hive.registerAdapter(ThemeNameAdapter());

  await Hive.openBox<Translation>('saved_translations');
  await Hive.openBox<ThemeName>('themedataname');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TranslationRepository>(
          create: (context) => TranslationRepository(
            translationApiService: TranslationApiService(),
            translationHiveService: TranslationHiveService(),
          ),
        ),
        RepositoryProvider<ThemeDataHiveService>(
          create: (context) => ThemeDataHiveService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(
              context.read<ThemeDataHiveService>(),
            ),
          ),
          BlocProvider<TranslationBloc>(
            create: (context) => TranslationBloc(
              context.read<TranslationRepository>(),
            ),
          ),
          BlocProvider<TranslationsBloc>(
            create: (context) => TranslationsBloc(
              context.read<TranslationRepository>(),
            ),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ChangeableThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'English word finder',
              theme:
                  MyTheme.buildThemeData(myThemes[state.themeName!.themeName]!),
              home: const AppPage(),
              routes: {
                SearchResultPage.routeName: (ctx) => const SearchResultPage(),
                SettingsPage.routeName: (ctx) => const SettingsPage(),
                AboutPage.routeName: (ctx) => const AboutPage(),
              },
            );
          },
        ),
      ),
    );
  }
}
