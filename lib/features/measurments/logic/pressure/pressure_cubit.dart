import 'package:bloc/bloc.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge/features/measurments/data/repo/pressure_mesurment_repo.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
import 'package:flutter/material.dart';

class PressureCubit extends Cubit<PressureState> {
  final PressureMeasurmentRepo _pressuretRepo;
  PressureCubit(this._pressuretRepo) : super(const PressureState.initial());

  List<BloodPressureMeasurement> bloodPressureMessurment = [];
  BloodPressureMeasurement? selectedMeasurement;

  TextEditingController diastolicController = TextEditingController();
  TextEditingController systolicController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();

  // Add Blood Pressure
  void emitAddBloodPressure() async {
    if (isClosed) return;
    emit(const PressureState.addBloodPressureLoading());

    final int? diastolicPressure =
        int.tryParse(diastolicController.text.trim());
    final int? systolicPressure = int.tryParse(systolicController.text.trim());
    final int? heartRate = int.tryParse(heartRateController.text.trim());

    if (diastolicPressure == null ||
        systolicPressure == null ||
        heartRate == null) {
      emit(const PressureState.addBloodPressureError());
      return;
    }

    final response = await _pressuretRepo.addBloodPressure(
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

        emit(const PressureState.addBloodPressureSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        emit(const PressureState.addBloodPressureError());
      },
    );
  }

  // Get Blood Pressure
  // Get Blood Pressure
  void fetchPressureData(String specificDate) async {
    if (isClosed) return;
    emit(const PressureState.getBloodPressureLoading());
    final response = await _pressuretRepo.getBloodPressure(specificDate);

    response.when(
      success: (pressure) async {
        if (isClosed) return;

        bloodPressureMessurment = pressure.toList();

        // تحقق إذا كانت القائمة غير فارغة قبل الوصول إلى العنصر الأخير
        if (bloodPressureMessurment.isNotEmpty) {
          selectedMeasurement = bloodPressureMessurment.last;

          // احصل على heartRate من القياس المحدد
          int heartRate =
              selectedMeasurement?.heartRate ?? 0; // تأكد من وجود قيمة
          emit(PressureState.getBloodPressureSuccess(
              heartRate: heartRate, bloodPressure: bloodPressureMessurment));
        } else {
          // إذا كانت القائمة فارغة، يمكنك التعامل مع الحالة حسب الحاجة
          emit(const PressureState.getBloodPressureEmpty());
        }
      },
      failure: (error) {
        if (isClosed) return;
        emit(const PressureState.getBloodPressureError());
      },
    );
  }
}
