import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/core/networking/dio_factory.dart';
import 'package:challenge/features/register/data/model/register_response_body.dart';
import 'package:dio/dio.dart';

class RegisterRepo {
  final ApiServices _apiServices;
  
  RegisterRepo(this._apiServices);

  Future<ApiResult<RegisterResponseBody>> register(FormData registerRequestBody) async {
    try {
      // final dio = DioFactory.getDio(isMultipart: true);
      final response = await _apiServices.register(registerRequestBody);
      print('API Response register: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error register: $error');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
