import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

// TODO: wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
          status: ResponseCode.NO_CONTENT,
          title: ResponseMessage.NO_CONTENT,
          errors: {'message': ResponseMessage.NO_CONTENT}, // مثال
        );
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
          status: ResponseCode.BAD_REQUEST,
          title: ResponseMessage.BAD_REQUEST,
          errors: {
            'message': [ResponseMessage.BAD_REQUEST]
          }, // مثال
        );
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
          status: ResponseCode.FORBIDDEN,
          title: ResponseMessage.FORBIDDEN,
          errors: {
            'message': [ResponseMessage.FORBIDDEN]
          },
        );
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
          status: ResponseCode.UNAUTORISED,
          title: ResponseMessage.UNAUTORISED,
          errors: {
            'message': [ResponseMessage.UNAUTORISED]
          },
        );
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
          status: ResponseCode.NOT_FOUND,
          title: ResponseMessage.NOT_FOUND,
          errors: {
            'message': [ResponseMessage.NOT_FOUND]
          },
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
          status: ResponseCode.INTERNAL_SERVER_ERROR,
          title: ResponseMessage.INTERNAL_SERVER_ERROR,
          errors: {
            'message': [ResponseMessage.INTERNAL_SERVER_ERROR]
          },
        );
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
          status: ResponseCode.CONNECT_TIMEOUT,
          title: ResponseMessage.CONNECT_TIMEOUT,
          errors: {
            'message': [ResponseMessage.CONNECT_TIMEOUT]
          },
        );
      case DataSource.CANCEL:
        return ApiErrorModel(
          status: ResponseCode.CANCEL,
          title: ResponseMessage.CANCEL,
          errors: {
            'message': [ResponseMessage.CANCEL]
          },
        );
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
          status: ResponseCode.RECIEVE_TIMEOUT,
          title: ResponseMessage.RECIEVE_TIMEOUT,
          errors: {
            'message': [ResponseMessage.RECIEVE_TIMEOUT]
          },
        );
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
          status: ResponseCode.SEND_TIMEOUT,
          title: ResponseMessage.SEND_TIMEOUT,
          errors: {
            'message': [ResponseMessage.SEND_TIMEOUT]
          },
        );
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
          status: ResponseCode.CACHE_ERROR,
          title: ResponseMessage.CACHE_ERROR,
          errors: {
            'message': [ResponseMessage.CACHE_ERROR]
          },
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
          status: ResponseCode.NO_INTERNET_CONNECTION,
          title: ResponseMessage.NO_INTERNET_CONNECTION,
          errors: {
            'message': [ResponseMessage.NO_INTERNET_CONNECTION]
          },
        );
      case DataSource.DEFAULT:
        return ApiErrorModel(
          status: ResponseCode.DEFAULT,
          title: ResponseMessage.DEFAULT,
          errors: {
            'message': [ResponseMessage.DEFAULT]
          },
        );
    }
  }
}

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(errors: {'message': 'Connection Timeout'});
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(errors: {'message': 'Send Timeout'});
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(errors: {'message': 'Receive Timeout'});
        case DioExceptionType.badResponse:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return ApiErrorModel.fromJson(error.response!.data);
          } else {
            return ApiErrorModel(errors: {'message': 'Bad Response'});
          }
        case DioExceptionType.badCertificate:
          return ApiErrorModel(errors: {'message': 'Bad Certificate'});
        case DioExceptionType.cancel:
          return ApiErrorModel(errors: {'message': 'Request Cancelled'});
        case DioExceptionType.connectionError:
          return ApiErrorModel(errors: {'message': 'Connection Error'});
        default:
          return ApiErrorModel(errors: {'message': 'Unknown Error'});
      }
    } else {
      return ApiErrorModel(errors: {'message': 'Something went wrong'});
    }
  }
}
ApiErrorModel _handleError( dynamic data) {
  return ApiErrorModel(
    status: data['status'], 
    title: data['message'],
    errors: data['errors'],

  );
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
