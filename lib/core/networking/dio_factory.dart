import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders({bool isMultipart = false}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'content-type': isMultipart ? 'multipart/form-data' : 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getString(SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    // إضافة PrettyDioLogger (يبقيه إن أردت شكل منسق)
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,  // لإظهار جسم الاستجابة بالكامل
      ),
    );

    // إضافة LogInterceptor للحصول على التفاصيل الكاملة
    dio?.interceptors.add(
      LogInterceptor(
        request: true,             // يعرض تفاصيل الطلب
        requestBody: true,         // يعرض جسم الطلب
        responseHeader: true,      // يعرض رؤوس الاستجابة
        responseBody: true,        // يعرض جسم الاستجابة
        error: true,               // يعرض أخطاء الطلب
        logPrint: (log) => print(log), // يمكنك تخصيص الـ log أو تركها كما هي
      ),
    );
  }
}
