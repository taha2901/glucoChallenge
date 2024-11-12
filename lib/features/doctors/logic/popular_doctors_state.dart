import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_doctors_state.freezed.dart';

@freezed
class PopularDoctorsState with _$PopularDoctorsState {
  const factory PopularDoctorsState.initial() = _Initial;
  //popular doctors
  const factory PopularDoctorsState.popularDoctorsLoading() = PopularDoctorsLoading;
  const factory PopularDoctorsState.popularDoctorsSuccess(
          {required List<PopularDoctorResponseBody> doctor}) =
      PopularDoctorsSuccess;
  const factory PopularDoctorsState.popularDoctorsError(ApiErrorModel apiErrorModel) =
      PopularDoctorsError;
}
