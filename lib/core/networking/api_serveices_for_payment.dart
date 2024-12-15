import 'package:dio/dio.dart';

class ApiServeicesForPayment {
  final Dio dio = Dio();
  Future<Response> POST({
    required String url,
    required body,
    String? token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }

  //Get
  Future<Response> get({
    required String url,
    String? token,
    Map<String, String>? headers,
  }) async {
    var response = await dio.get(
      url,
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }
}
