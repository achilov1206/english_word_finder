import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './search_page.dart';
import './favorite_page.dart';
import './history_page.dart';
import './about_page.dart';
import './settings_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;
  String? _title;

  static List<Widget> pages = [
    const SearchPage(),
    const FavoritePage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppLocalizations.of(context).search,
      AppLocalizations.of(context).favourite,
      AppLocalizations.of(context).searchHistory,
    ];

    void _onNavigationTapped(int index) {
      setState(() {
        _selectedIndex = index;
        _title = titles[index];
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? 'Search'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {
                Navigator.of(context).pushNamed(SettingsPage.routeName);
              } else {
                Navigator.of(context).pushNamed(AboutPage.routeName);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppLocalizations.of(context).settings),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(AppLocalizations.of(context).about),
                ),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            label: titles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite,
              size: 30,
            ),
            label: titles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.history,
              size: 30,
            ),
            label: titles[2],
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavigationTapped,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: pages.elementAt(_selectedIndex),
          ),
        ),
      ),
    );
  }
}
