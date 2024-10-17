class ApiConstants {
  static const String apiBaseUrl = 'http://diabetes.runasp.net/api/';

  static const String login = 'Auth/Login';

  static const String register = 'Auth/register';

  static const String doctor = 'Doctors/SelectDoctors';
  static const String reservation = 'Doctors/Reservation';
  static const String reservationBase = 'Doctors/Reservation';

  static const String medicines = 'Medicine/Get medicines for user';

  static const String addMedicine = 'Medicine/AddMedicines';

  static const String bloodSugar = 'Measurements/blood sugar level';

  static const String bloodPressure = 'Measurements/blood pressure';

  static const String weight = 'Measurements/weight';

}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
