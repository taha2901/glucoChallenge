import 'package:bloc/bloc.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge/features/measurments/data/repo/suger_measurments_repo.dart';
import 'package:challenge/features/measurments/logic/suger/suger_state.dart';
import 'package:flutter/material.dart';


class MeasurmentsCubit extends Cubit<MeasurmentsState> {
  final MeasurmentRepo _measurmentRepo;

  MeasurmentsCubit(this._measurmentRepo)
      : super(const MeasurmentsState.initial());

  List<SugarMeasurement> sugarMeasurements = [];

  TextEditingController measurementDateController = TextEditingController();
  TextEditingController sugarReadingController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController sportController = TextEditingController();

  // Add Blood Sugar
  void emitAddBloodSugar(String measurementDate, int sugarReading) async {
    if (isClosed) return;
    emit(const MeasurmentsState.addBloodSugerLoading());

    if (sugarReading == null) {
      emit(const MeasurmentsState.addBloodSugerError(
          error: "Invalid sugar reading"));
      return;
    }

    final response = await _measurmentRepo.addBloodSugar(
      BloodSugerRequestBody(
        dateTime: DateTime.now(),
        measurementDate: measurementDate,
        sugarReading: sugarReading,
      ),
    );

    response.when(
      success: (addMedicine) async {
        if (isClosed) return;

        emit(const MeasurmentsState.addBloodSugerSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        emit(MeasurmentsState.addBloodSugerError(error: error.toString()));
      },
    );
  }

  //get blood suger
  Future<void> fetchSugarData(String specificDate) async {
    if (isClosed) return;
    emit(const MeasurmentsState.getBloodSugerLoading());
    final response = await _measurmentRepo.getBloodSuger(specificDate);
    response.when(success: (bloodSugar) async {
      sugarMeasurements = bloodSugar.toList();
      if (isClosed) return;
      emit(
          MeasurmentsState.getBloodSugerSuccess(bloodSugar: sugarMeasurements));
    }, failure: (error) {
      if (isClosed) return;
      emit(MeasurmentsState.getBloodSugerError(error: error.toString()));
    });
  }
}
