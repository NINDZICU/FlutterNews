import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

extension StringDateExtensions on String {
  static const String _fullDatePattern = 'dd MMMM, yyyy';

  String get timeAgo => timeago.format(DateTime.parse(this));

  String get fullDate =>
      DateFormat(_fullDatePattern).format(DateTime.parse(this)).toString();
}
