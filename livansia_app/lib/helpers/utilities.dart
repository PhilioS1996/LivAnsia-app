import 'package:intl/intl.dart';

class Utilities {
  static int textButtonSize = 34;

  DateTime parseDate(String dateString) {
    List<String> components = dateString.split(' ');
    String month = components[0];
    int day = int.parse(components[1].replaceAll(',', ''));
    int year = int.parse(components[2]);
    String time = components[3];
    String meridian = components[4];

    List<String> timeComponents = time.split(':');
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);

    if (meridian == 'PM' && hour != 12) {
      hour += 12;
    }

    return DateTime(
        year, DateTime.parse(month + " 1, 2024").month, day, hour, minute);
  }

  List<DateTime> extractDates(String data) {
    RegExp regExp =
        RegExp(r'([A-Z][a-z]{2} \d{1,2}, \d{4} \d{1,2}:\d{2} [AP]M)');
    Iterable<Match> matches = regExp.allMatches(data);
    List<DateTime> dates = [];
    for (Match match in matches) {
      String dateStr = match.group(0)!;
      DateTime date = DateFormat('y,M,d').parse(dateStr);
      dates.add(date);
    }
    return dates;
  }
}
