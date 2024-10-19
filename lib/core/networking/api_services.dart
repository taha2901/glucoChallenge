import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_request_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';
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
import 'package:challenge/features/medicine/data/model/add_medicine_request_model.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_response_model.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';
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
  @GET(ApiConstants.doctor)
  Future<List<DoctorResponseBody>> getDoctors();

  @POST(ApiConstants.reservationBase)
  Future<ReservationResponseBody> addReservation(
    @Query("id") int id,
    @Body() ReservationRequestBody reservationRequestBody,
  );
  @GET(ApiConstants.medicines)
  Future<List<GetMedicineResponseBody>> getMedicine();

  @POST(ApiConstants.addMedicine)
  Future<AddMedicineResponseBody> addMedicine(
    @Body() AddMedicineRequestBody addMedicineRequestBody,
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
}
