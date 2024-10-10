class ApiConstants {
  static const String apiBaseUrl = 'https://student.valuxapps.com/api/';

  static const String login = 'login';

  static const String register = 'register';

  static const String categories = 'categories';

  static const String categoryDetails = '$categories/{categoryId}';

  static const String home = 'home';

  static const String notifications = 'notifications';

  static const String cart = 'carts';

  static const String addOrRemoveCart = 'carts';

  static const String settings = 'profile';

  static const String changePassword = 'change-password';

  static const String updateProfile = 'update-profile';

  static const String addresses = 'addresses';

  static const String favourite = 'favorites';

  static const String paymentIntent= 'https://api.stripe.com/v1/payment_intents';
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
