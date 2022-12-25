
getDateTime(DateTime dateTime) {
  String date =  dateTime.toString().substring(0, 10);
  return date ;
}
getDateTimeString(String dateTime) {
  String date =  dateTime.substring(0, 10);
  return date ;
}

getTimeString(String dateTime) {
  String date =  dateTime.substring(11, 16);
  return date ;
}
