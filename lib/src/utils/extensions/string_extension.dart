extension StringExtension on String {
  String dateFormat() {
    final month = substring(5, 7);
    final dayOfMonth = substring(8, 10);
    return "$dayOfMonth/$month";
  }

  String dateFormatWithTime() {
    final month = substring(5, 7);
    final dayOfMonth = substring(8, 10);
    final year = substring(0, 4);
    final hour = substring(11, 13);
    final minute = substring(14, 16);
    final second = substring(17, 19);
    return "$dayOfMonth/$month/$year - $hour:$minute:$second";
  }
}
