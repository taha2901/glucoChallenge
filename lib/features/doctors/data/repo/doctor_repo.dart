import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_request_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';

class DoctorRepo {
  final ApiServices _apiService;

  DoctorRepo(this._apiService);

  Future<ApiResult<List<DoctorResponseBody>>> getDoctors() async {
    try {
      final response = await _apiService.getDoctors();
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<AvailableTimesResponse>> getAvailableTime(int id, String date) async {
    try {
      final response = await _apiService.getAvailableTime(id, date);
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<ReservationResponseBody>> addReservation(int doctorId, ReservationRequestBody reservationRequestBody) async {
    try {
      final response = await _apiService.addReservation(doctorId, reservationRequestBody);
      print('Doctor ID IS: ${doctorId.toString()}');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }
}
