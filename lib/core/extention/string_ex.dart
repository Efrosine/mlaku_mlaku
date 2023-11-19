import 'package:intl/intl.dart';

extension MyString on DateTime {
  String toHumanString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
