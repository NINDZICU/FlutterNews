import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

extension StringDateExtensions on String {
  static const String _fullDatePattern = 'dd MMMM, yyyy';
  static const String _shortDatePattern = 'd MMMM';

  String get timeAgo => timeago.format(DateTime.parse(this));

  String get fullDate =>
      DateFormat(_fullDatePattern).format(DateTime.parse(this)).toString();

  String get shortDate =>
      DateFormat(_shortDatePattern).format(DateTime.parse(this)).toString();
}
