import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate).toLocal();
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inMinutes < NumberConstants.value_1) {
    return StringConstants.justNow;
  } else if (difference.inMinutes < NumberConstants.value_60) {
    return '${difference.inMinutes} ${StringConstants.minutesAgo}';
  } else if (difference.inHours < NumberConstants.value_24) {
    return '${difference.inHours} ${StringConstants.hoursAgo}';
  } else {
    return DateFormat('MMM d').format(dateTime);
  }
}

enum FilterType {
  title(StringConstants.title),
  category(StringConstants.category),
  author(StringConstants.author);

  final String label;

  const FilterType(this.label);

  @override
  String toString() => label;
}
