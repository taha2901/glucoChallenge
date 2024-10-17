import 'package:bloc/bloc.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_request_model.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';
import 'package:challenge/features/medicine/data/repo/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_state.dart';
part 'medicine_cubit.freezed.dart';

class MedicineCubit extends Cubit<MedicineState> {
  static MedicineCubit get(context) => BlocProvider.of(context);
  List<GetMedicineResponseBody> getMedicines = [];
  final MedicineRepo _medicineRepo;

  MedicineCubit(this._medicineRepo) : super(const MedicineState.initial());

  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getMedicine() async {
    if (isClosed) return;
    emit(const MedicineState.loading());
    final response = await _medicineRepo.getMedicines();
    response.when(success: (medicine) {
      if (isClosed) return;
      getMedicines = medicine.toList();
      emit(const MedicineState.success());
    }, failure: (errorHandler) {
      if (isClosed) return;
      emit(const MedicineState.error());
    });
  }

  // إضافة الدواء وإعداد الإشعار
  void emitAddMedicine() async {
    if (isClosed) return;
    emit(const MedicineState.addMedicineLoading());

    final response = await _medicineRepo.addMedicine(
      AddMedicineRequestBody(
        name: nameController.text.trim(),
        dosage: dosageController.text.trim(),
        time: timeController.text.trim(),
        times: countController.text.trim(),
      ),
    );

    response.when(
      success: (addMedicine) async {
        if (isClosed) return;

        // Schedule a notification for the medicine time
        await NotificationService().scheduleNotification(
          body: 'تذكير بتناول الدواء: ${nameController.text.trim()}',
          timePreference: timeController.text.trim(),
        );
        print('Notification Scheduled for: ${timeController.text.trim()}');

        debugPrint('addMedicine Is: ${addMedicine.toString()}');
        emit(const MedicineState.addMedicineSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        debugPrint('addMedicine Error Is: ${error.toString()}');
        emit(const MedicineState.addMedicineError());
      },
    );
  }
}
