import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_request.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_response.dart';
import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:challenge/features/favourite/data/models/get_doctor_favourite_response.dart';

class FavouriteRepo {
  final ApiServices _apiService;

  FavouriteRepo(this._apiService);

  Future<ApiResult<List<FavouriteDoctorResponse>>> getFavourite() async {
    try {
      final response = await _apiService.getFavourite();
      print("API Response fetching favourite: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error fetching favourite: ${error.toString()}");
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  
 Future<ApiResult<AddOrRemoveFavouriteResponseModel>> addOrRemoveFavourite(
    AddOrRemoveFavouriteRequestModel addOrRemoveFavouriteRequestModel,
  ) async {
    try {
      final response =
          await _apiService.addOrRemoveFavourite(addOrRemoveFavouriteRequestModel);

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
