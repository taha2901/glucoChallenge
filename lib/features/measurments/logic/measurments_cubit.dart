import 'package:bloc/bloc.dart';
import 'package:challenge/features/measurments/data/model/blood_pressure_request_model.dart';
import 'package:challenge/features/measurments/data/model/blood_suger_request_model.dart';
import 'package:challenge/features/measurments/data/model/weight_request_model.dart';
import 'package:challenge/features/measurments/data/repo/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurments_state.dart';
part 'measurments_cubit.freezed.dart';

class MeasurmentsCubit extends Cubit<MeasurmentsState> {
  final MeasurmentRepo _measurmentRepo;

  MeasurmentsCubit(this._measurmentRepo)
      : super(const MeasurmentsState.initial());

  TextEditingController measurementDateController = TextEditingController();
  TextEditingController sugarReadingController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController sportController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();
  TextEditingController systolicController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();

  // Add Blood Sugar
  void emitAddBloodSugar(String measurementDate, int sugarReading) async {
    if (isClosed) return;
    emit(const MeasurmentsState.addBloodSugerLoading());

    // final int? sugarReading = int.tryParse(sugarReadingController.text.trim());
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

  // Add Weight
  void emitAddWeight(int weight, String? activity) async {
    if (isClosed) return;
    emit(const MeasurmentsState.addWeightLoading());

    final response = await _measurmentRepo.addWeight(
      WeightRequestBody(
        sport: activity == "مشى"
            ? true
            : false, // قم بتحديد إذا كان النشاط مشي أو جري
        weight: weight,
      ),
    );

    response.when(
      success: (addWeight) async {
        if (isClosed) return;

        emit(const MeasurmentsState.addWeightSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        emit(const MeasurmentsState.addWeightError());
      },
    );
  }

// Add Blood Pressure
  void emitAddBloodPressure() async {
    if (isClosed) return;
    emit(const MeasurmentsState.addBloodPressureLoading());

    final int? diastolicPressure =
        int.tryParse(diastolicController.text.trim());
    final int? systolicPressure = int.tryParse(systolicController.text.trim());
    final int? heartRate = int.tryParse(heartRateController.text.trim());

    if (diastolicPressure == null ||
        systolicPressure == null ||
        heartRate == null) {
      emit(const MeasurmentsState.addBloodPressureError());
      return;
    }

    final response = await _measurmentRepo.addBloodPressure(
      BloodPressureRequestBody(
        dateTime: DateTime.now(),
        diastolicPressure: diastolicPressure,
        heartRate: heartRate,
        systolicPressure: systolicPressure,
      ),
    );

    response.when(
      success: (addPressure) async {
        if (isClosed) return;

        emit(const MeasurmentsState.addBloodPressureSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        emit(const MeasurmentsState.addBloodPressureError());
      },
    );
  }
}
