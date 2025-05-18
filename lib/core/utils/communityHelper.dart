class Communityhelper {
  static String formatDateTime(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String hours = dateTime.hour.toString().padLeft(2, '0');
    String minutes = dateTime.minute.toString().padLeft(2, '0');

    return "$day/$month $hours:$minutes";
  }
}
