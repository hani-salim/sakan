import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String formatDate({DateTime? date}) {
    date ??= DateTime.now();
    return DateFormat.yMMMd().format(date);
  }

  static String formatTime({required BuildContext context, TimeOfDay? time}) {
    time ??= TimeOfDay.now();
    return time.format(context).toString();
  }
}
