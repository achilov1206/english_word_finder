import 'package:intl/intl.dart';

class DateTimeHelper {
  static String dateFormatMMMEd(DateTime dateTime) {
    // String languageCode = AppLocalizations.of(context)!.localeName;
    // return DateFormat.MMMEd(languageCode).format(dateTime);

    return DateFormat.MMMMEEEEd().format(dateTime);
  }
}
