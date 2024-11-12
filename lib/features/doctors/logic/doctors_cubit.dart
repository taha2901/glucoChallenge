import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:challenge/features/doctors/data/model/reservation_request_body.dart';
import 'package:challenge/features/doctors/data/repo/doctor_repo.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorRepo _doctorRepo;
  DoctorsCubit(this._doctorRepo) : super(const DoctorsState.initial());
  List<DoctorResponseBody> doctorResponseBody = [];
  List<PopularDoctorResponseBody> popularDoctorResponseBody = [];
  AvailableTimesResponse? availableTimesResponse;
  static DoctorsCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final sexController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  void getDoctors() async {
    if (isClosed) return;
    emit(const DoctorsState.doctorLoading());
    final response = await _doctorRepo.getDoctors();
    response.when(
      success: (doctorData) {
        if (isClosed) return;
        doctorResponseBody = doctorData.toList();
        emit(DoctorsState.doctorSuccess(doctor: doctorResponseBody));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(DoctorsState.doctorError(apiErrorModel));
      },
    );
  }

  void getAvailableTime(int id, String formattedDate) async {
    if (isClosed) return;
    emit(const DoctorsState.availableTimeLoading());

    final response = await _doctorRepo.getAvailableTime(
      id,
      formattedDate,
    );

    response.when(
      success: (availableTime) {
        if (isClosed) return;
        availableTimesResponse = availableTime;
        emit(DoctorsState.availableTimeSuccess(
          availableTimeResponse: availableTime,
        ));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(DoctorsState.availableTimeError(apiErrorModel));
      },
    );
  }

  void emitReservationStates({
    required String username,
    required String phone,
    required int age,
    required String sex,
    required String date,
    required int doctorId,
    required String time,
    BuildContext? context,
  }) async {
    if (isClosed) return;
    emit(const DoctorsState.reservationLoading());
    final response = await _doctorRepo.addReservation(
      doctorId,
      ReservationRequestBody(
        age: age,
        date: date,
        phone: phone,
        sex: sex,
        time: time,
        username: username,
      ),
    );
    response.when(
      success: (reservationResponse) {
        // context?.read<MedicalRecordCubit>().getMedicalRecord();
        if (isClosed) return;
        emit(
          DoctorsState.reservationSuccess(
              reservationResponse: reservationResponse),
        );
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(DoctorsState.reservationError(apiErrorModel));
      },
    );
  }
  //delete reservation
  void deleteReservation(int reservationId, BuildContext context) async {
    if (isClosed) return;
    emit(const DoctorsState.deleteReservationLoading());
    final response = await _doctorRepo.deleteReservation(reservationId);
    response.when(success: (deleteReservaionResponse) {
      if (isClosed) return;
      emit(
        DoctorsState.deleteReservationSuccess(
            deleteReservaionResponse: deleteReservaionResponse),
      );
      // context.read<MedicalRecordCubit>().getMedicalRecord();
    }, failure: (apiErrorModel) {
      if (isClosed) return;
      emit(DoctorsState.deleteReservationError(apiErrorModel));
    });
  }
}
