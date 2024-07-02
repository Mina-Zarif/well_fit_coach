bool compareDateTime(DateTime dateTime) {
  return (dateTime.day == DateTime.now().day &&
          dateTime.month == DateTime.now().month) ||
      dateTime.isAfter(DateTime.now());
}
