import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';
@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.doctorLoading() = DoctorLoading;
  const factory DoctorsState.doctorSuccess( {required List<DoctorResponseBody> doctor}) = DoctorSuccess;
  const factory DoctorsState.doctorError({required String error}) = DoctorError;


  const factory DoctorsState.reservationLoading() = ReservationLoading;
  const factory DoctorsState.reservationSuccess({required ReservationResponseBody reservationResponse}) = ReservationSuccess;
  const factory DoctorsState.reservationError({required String error}) = ReservationError;
}
