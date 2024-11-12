import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/delete_reservaion_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';
@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.doctorLoading() = DoctorLoading;
  const factory DoctorsState.doctorSuccess( {required List<DoctorResponseBody> doctor}) = DoctorSuccess;
  const factory DoctorsState.doctorError(ApiErrorModel apiErrorModel) = DoctorError;

   //available time

  const factory DoctorsState.availableTimeLoading() = AvailableTimeLoading;
  const factory DoctorsState.availableTimeSuccess({required AvailableTimesResponse availableTimeResponse}) = AvailableTimeSuccess;
  const factory DoctorsState.availableTimeError(ApiErrorModel apiErrorModel) = AvailableTimeError;


  const factory DoctorsState.reservationLoading() = ReservationLoading;
  const factory DoctorsState.reservationSuccess({required ReservationResponseBody reservationResponse}) = ReservationSuccess;
  const factory DoctorsState.reservationError(ApiErrorModel apiErrorModel) = ReservationError;


  //delete reservation
  const factory DoctorsState.deleteReservationLoading() = DeleteReservationLoading;
  const factory DoctorsState.deleteReservationSuccess( {required DeleteReservaionResponse deleteReservaionResponse}) = DeleteReservationSuccess;
  const factory DoctorsState.deleteReservationError(ApiErrorModel apiErrorModel) = DeleteReservationError;
}


