import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/features/doctors/data/model/add_comment_request_body.dart';
import 'package:challenge/features/doctors/data/model/add_comment_response_body.dart';
import 'package:challenge/features/doctors/data/model/add_rate_request.dart';
import 'package:challenge/features/doctors/data/model/add_rate_response.dart';
import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/delete_reservaion_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_comment_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
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

  Future<ApiResult<List<PopularDoctorResponseBody>>> getPopularDoctors() async {
    try {
      final response = await _apiService.getPopularDoctor();
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<AvailableTimesResponse>> getAvailableTime(
      int id, String date) async {
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

  Future<ApiResult<ReservationResponseBody>> addReservation(
      int doctorId, ReservationRequestBody reservationRequestBody) async {
    try {
      final response =
          await _apiService.addReservation(doctorId, reservationRequestBody);
      print('Doctor ID IS: ${doctorId.toString()}');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  //delete reservation
  Future<ApiResult<DeleteReservaionResponse>> deleteReservation(int id) async {
    try {
      final response = await _apiService.cancelReservation(id);
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<List<DoctorCommentResponse>>> getDoctorComments(
    int id,
  ) async {
    try {
      final response = await _apiService.getComments(id);

      print('API Response Doctor Comments: $response');
      return ApiResult.success(response);
    } catch (error) {
      print(' API Error Doctor Comments: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }

  //add doctor comment
  Future<ApiResult<AddCommentResponseBody>> addComment(
      int id, AddCommentRequestBody addCommentRequestBody) async {
    try {
      final response = await _apiService.addComment(id, addCommentRequestBody);
      print("API Add Comment Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Add Comment Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  //add rate
  Future<ApiResult<AddRateResponse>> addRate(
      AddRateRequest addRateRequest) async {
    try {
      final response = await _apiService.addRate(addRateRequest);
      print("API Add Rate Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Add Rate Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }
}
