import 'dart:developer';

import 'package:intl/intl.dart';

int dateFormat(int time, String format) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat(format);
  result = formatter.format(date);
  DateTime parseDate = DateFormat(format).parse(result);
  return parseDate.millisecondsSinceEpoch;
}

int dateInMillisecondsSinceEpoch(DateTime date, String format) {
  String result = '';
  final DateFormat formatter = DateFormat(format);
  result = formatter.format(date);
  DateTime parseDate = DateFormat(format).parse(result);
  log("parseDate $parseDate");
  return parseDate.millisecondsSinceEpoch;
}

String displayDayAndDateTimestamp(int time, format) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat(format);
  result = formatter.format(date);
  return result;
}

String displayDayAndDateTimes(String time, format) {
  String year = time.toString().substring(0, 4);
  String month = time.toString().substring(4, 6);
  String day = time.toString().substring(6, 8);
  String horse = time.substring(time.length - 4).toString().substring(0, 2);
  String minute = time.substring(time.length - 2).toString();

  DateTime parsedDate = DateFormat("yyyy/MM/dd hh:mm").parse("$year/$month/$day $horse:$minute");
  DateTime newParsedDate = parsedDate.add(const Duration(hours: 5, minutes: 30));

  final DateFormat formats = DateFormat(format);

  String dateString = formats.format(newParsedDate);

  return dateString;
}
