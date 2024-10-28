import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_suger_response_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';

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
        ApiErrorHandler.handle(error),
      );
    }
  }

  //get Blood suger
  Future<ApiResult<List<SugarMeasurement>>> getBloodSuger(String specificDate) async {
    try {
      final response = await _apiService.getBloodSuger(specificDate);

      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
       ApiErrorHandler.handle(error),
      );
    }
  }

  // // Add Blood Pressure
  // Future<ApiResult<BloodPressureResponseBody>> addBloodPressure(
  //   BloodPressureRequestBody addPressureRequestBody,
  // ) async {
  //   try {
  //     final response =
  //         await _apiService.addBloodPressure(addPressureRequestBody);

  //     print('API Response: $response');
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     print('API Error: $error');
  //     return ApiResult.failure(
  //       ApiErrorModel(
  //         message: error.toString(),
  //       ),
  //     );
  //   }
  // }

}
