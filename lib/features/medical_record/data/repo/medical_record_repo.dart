import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/medical_record/data/model/delete_medical_record/delete_medical_record.dart';
import 'package:challenge/features/medical_record/data/model/medical_record/medical_record.dart';

class MedicalRecordRepo {
  final ApiServices _apiService;
  MedicalRecordRepo(this._apiService);

  Future<ApiResult<MedicalRecord>> getMedicalRecord() async {
    try {
      final response = await _apiService.getMedicalRecord();

      print('API Response Medical Record: $response');
      return ApiResult.success(response);

    } catch (error) {
      print('API Error Medical Record: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }



  Future<ApiResult<DeleteMedicalRecord>> getDeleteMedicalRecord() async {
    try {
      final response = await _apiService.deleteMedicalRecord();

      print('API Response Medical Record: $response');
      return ApiResult.success(response);

    } catch (error) {
      print('API Error Medical Record: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }
}
