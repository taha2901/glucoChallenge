bool isLoggedInUser = false;
String? currentPassword;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  // static const String userPassword = 'userPassword';

  static const String onboard = 'onboard';
  // static const String userPhotoUrl = 'photoUrl';

  // static const String myName = 'myName';
}

class DateHelper {
 static String getCurrentDate() {
  DateTime currentDate = DateTime.now();
  return "${currentDate.year}-${currentDate.month}-${currentDate.day}";
}
}
