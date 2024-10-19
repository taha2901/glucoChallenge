import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_response_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';

class PressureMeasurmentRepo {
  final ApiServices _apiService;
  PressureMeasurmentRepo(this._apiService);

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
  //get blood pressure
  Future<ApiResult<List<BloodPressureMeasurement>>> getBloodPressure(
      String specificDate) async {
    try {
      final response = await _apiService.getPressure(specificDate);

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
