import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/weight_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/weight_response_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';

class WeightMeasurmentRepo {
  final ApiServices _apiService;
  WeightMeasurmentRepo(this._apiService);

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

  //get Weight
  Future<ApiResult<List<WeightMeasurement>>> getWeight(
      String specificDate) async {
    try {
      final response = await _apiService.getWeight(specificDate);

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
