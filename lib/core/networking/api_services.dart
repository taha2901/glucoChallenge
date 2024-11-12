import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/delete_reservaion_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_request_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_request.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_response.dart';
import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:challenge/features/login/data/model/login_request_body.dart';
import 'package:challenge/features/login/data/model/login_response_body.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_response_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_suger_response_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/weight_request_model.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/weight_response_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';
import 'package:challenge/features/medical_record/data/model/delete_medical_record/delete_medical_record.dart';
import 'package:challenge/features/medical_record/data/model/medical_record/medical_record.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_request_model.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_response_model.dart';
import 'package:challenge/features/medicine/data/model/delete_medicine_response/delete_medicine_response.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';
import 'package:challenge/features/register/data/model/register_response_body.dart';
import 'package:challenge/features/settings/data/models/update_user_request.dart';
import 'package:challenge/features/settings/data/models/update_user_response.dart';
import 'package:challenge/features/settings/data/models/user_details_response.dart';
import 'package:challenge/features/sports/data/model/exercise_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.register)
  Future<RegisterResponseBody> register(@Body() FormData formData);

  @GET(ApiConstants.doctor)
  Future<List<DoctorResponseBody>> getDoctors();

  @GET(ApiConstants.popularDoctor)
  Future<List<PopularDoctorResponseBody>> getPopularDoctor();

  @POST(ApiConstants.reservation)
  Future<ReservationResponseBody> addReservation(
    @Query("id") int id,
    @Body() ReservationRequestBody reservationRequestBody,
  );

  @DELETE(ApiConstants.cancelReservation)
  Future<DeleteReservaionResponse> cancelReservation(
    @Query("id") int id,
  );
  @GET(ApiConstants.availableTime)
  Future<AvailableTimesResponse> getAvailableTime(
    @Query("id") int id,
    @Query("date") String date,
  );
  @GET(ApiConstants.medicines)
  Future<List<GetMedicineResponseBody>> getMedicine();

  @POST(ApiConstants.addMedicine)
  Future<AddMedicineResponseBody> addMedicine(
    @Body() AddMedicineRequestBody addMedicineRequestBody,
  );

  @DELETE(ApiConstants.deleteMedicine)
  Future<DeleteMedicineResponse> deleteMedicine(
    @Query("id") int id,
  );

  @POST(ApiConstants.bloodSugar)
  Future<BloodSugerResponseBody> addBloodSugar(
    @Body() BloodSugerRequestBody addMedicineRequestBody,
  );

  @POST(ApiConstants.bloodPressure)
  Future<BloodPressureResponseBody> addBloodPressure(
    @Body() BloodPressureRequestBody addMedicineRequestBody,
  );
  @POST(ApiConstants.weight)
  Future<WeightResponse> addWeight(
    @Body() WeightRequestBody addMedicineRequestBody,
  );
  @GET(ApiConstants.getBloodSuger)
  Future<List<SugarMeasurement>> getBloodSuger(
      @Query('specificDate') String specificDate);

  @GET(ApiConstants.getWeight)
  Future<List<WeightMeasurement>> getWeight(
      @Query('specificDate') String specificDate);

  @GET(ApiConstants.getPressure)
  Future<List<BloodPressureMeasurement>> getPressure(
      @Query('specificDate') String specificDate);

  @GET(ApiConstants.settings)
  Future<UserDetailsResponse> getProfile();

  @PUT(ApiConstants.updateProfile)
  Future<UpdateUserResponse> updateProfile(
    @Body() UpdateUserRequest updateProfileRequestModel,
  );
  @GET(ApiConstants.getExercise)
  Future<List<Exercise>> gerExercise();

  @GET(ApiConstants.getFavourite)
  Future<List<FavouriteDoctorResponse>> getFavourite();

  @POST(ApiConstants.addFavourite)
  Future<AddOrRemoveFavouriteResponseModel> addOrRemoveFavourite(
    @Body() AddOrRemoveFavouriteRequestModel addDoctorRequest,
  );

  @GET(ApiConstants.medicalRecord)
  Future<MedicalRecord> getMedicalRecord();

  @GET(ApiConstants.deleteMedicalRecord)
  Future<DeleteMedicalRecord> deleteMedicalRecord();
}
