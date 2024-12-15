import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/add_person/data/model/add_person_model.dart';
// ignore: unused_import
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';

class AddPersonRepo {
  final ApiServices _apiService;

  AddPersonRepo(this._apiService);

  Future<ApiResult<AddPersonModel>> addPerson(
    String email,
    String phone,
    String relvantRelation,
  ) async {
    try {
      final response =
          await _apiService.addPerson(email, phone, relvantRelation);
      print('Add Person  IS: ${response.toString()}');
      return ApiResult.success(response);
    } catch (error) {
      print('Add Person Error: $error');
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }
}
