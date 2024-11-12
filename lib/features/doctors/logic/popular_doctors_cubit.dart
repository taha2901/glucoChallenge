import 'package:bloc/bloc.dart';
import 'package:challenge/features/doctors/data/model/available_time_response.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:challenge/features/doctors/data/repo/popular_doctor_repo.dart';
import 'package:challenge/features/doctors/logic/popular_doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularDoctorsCubit extends Cubit<PopularDoctorsState> {
  final PopularDoctorRepo _doctorRepo;
  PopularDoctorsCubit(this._doctorRepo)
      : super(const PopularDoctorsState.initial());
  List<PopularDoctorResponseBody> popularDoctorResponseBody = [];
  AvailableTimesResponse? availableTimesResponse;
  static PopularDoctorsCubit get(context) => BlocProvider.of(context);

  void getPopularDoctors() async {
    if (isClosed) return;
    emit(const PopularDoctorsState.popularDoctorsLoading());
    final response = await _doctorRepo.getPopularDoctors();
    response.when(success: (popularDoctorData) {
      if (isClosed) return;
      popularDoctorResponseBody = popularDoctorData.toList();
      emit(PopularDoctorsState.popularDoctorsSuccess(
          doctor: popularDoctorResponseBody));
    }, failure: (apiErrorModel) {
      if (isClosed) return;
      emit(PopularDoctorsState.popularDoctorsError(apiErrorModel));
    });
  }
}
