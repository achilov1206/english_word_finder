import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/ic_launcher/play_store_512.png',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).findEglishWord,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  initialValue: '1.0.0',
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).version,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  initialValue: 'achilovo1294@yandex.com',
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).contactInformation,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  initialValue: 'https://dictionaryapi.dev/',
                  decoration: const InputDecoration(
                    labelText: 'API',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
