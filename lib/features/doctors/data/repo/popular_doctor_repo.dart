import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:flutter/material.dart';

class PopularDoctorRepo {
  final ApiServices _apiService;

  PopularDoctorRepo(this._apiService);

  Future<ApiResult<List<PopularDoctorResponseBody>>> getPopularDoctors() async {
    try {
      final response = await _apiService.getPopularDoctor();
      debugPrint("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      debugPrint("API Error: ${error.toString()}");
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }
}
