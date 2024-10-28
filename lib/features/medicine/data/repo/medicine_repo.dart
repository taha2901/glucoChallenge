import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_request_model.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_response_model.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';

class MedicineRepo {
  final ApiServices _apiService;
  MedicineRepo(this._apiService);

  Future<ApiResult<List<GetMedicineResponseBody>>> getMedicines() async {
    try {
      final response = await _apiService.getMedicine();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error),);
    }
  }

  Future<ApiResult<AddMedicineResponseBody>> addMedicine(
    AddMedicineRequestBody addMedicineRequestBody,
  ) async {
    try {
      final response =
          await _apiService.addMedicine(addMedicineRequestBody);

      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
       ApiErrorHandler.handle(error),
      );
    }
  }
}
