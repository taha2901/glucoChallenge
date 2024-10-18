import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/measurments/data/model/blood_pressure_request_model.dart';
import 'package:challenge/features/measurments/data/model/blood_pressure_response_model.dart';
import 'package:challenge/features/measurments/data/model/blood_suger_request_model.dart';
import 'package:challenge/features/measurments/data/model/blood_suger_response_model.dart';
import 'package:challenge/features/measurments/data/model/weight_request_model.dart';
import 'package:challenge/features/measurments/data/model/weight_response_model.dart';

class MeasurmentRepo {
  final ApiServices _apiService;
  MeasurmentRepo(this._apiService);

  // Add Blood Sugar
  Future<ApiResult<BloodSugerResponseBody>> addBloodSugar(
    BloodSugerRequestBody addSugerRequestBody,
  ) async {
    try {
      final response = await _apiService.addBloodSugar(addSugerRequestBody);

      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
        ApiErrorModel(
          message: error.toString(),
        ),
      );
    }
  }

  // Add Blood Pressure
  Future<ApiResult<BloodPressureResponseBody>> addBloodPressure(
    BloodPressureRequestBody addPressureRequestBody,
  ) async {
    try {
      final response =
          await _apiService.addBloodPressure(addPressureRequestBody);

      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
        ApiErrorModel(
          message: error.toString(),
        ),
      );
    }
  }

  //add weight
  Future<ApiResult<WeightResponse>> addWeight(
    WeightRequestBody addWeight,
  ) async {
    try {
      final response = await _apiService.addWeight(addWeight);

      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
        ApiErrorModel(
          message: error.toString(),
        ),
      );
    }
  }
}
