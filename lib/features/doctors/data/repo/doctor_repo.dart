import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
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
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }

  Future<ApiResult<ReservationResponseBody>> addReservation(
    int doctorId, // أضف doctorId هنا
    ReservationRequestBody reservationRequestBody,
  ) async {
    try {
      final response =
          await _apiService.addReservation(doctorId, reservationRequestBody);
      print('Doctor ID ISssss: ${doctorId.toString()}');
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
