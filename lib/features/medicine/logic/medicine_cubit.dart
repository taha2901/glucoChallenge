import 'package:bloc/bloc.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/features/medicine/data/model/add_medicine_request_model.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';
import 'package:challenge/features/medicine/data/repo/medicine_repo.dart';
import 'package:challenge/features/medicine/logic/medicine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MedicineCubit extends Cubit<MedicineState> {
  final MedicineRepo _medicineRepo;
  List<GetMedicineResponseBody> getMedicines = [];

  MedicineCubit(this._medicineRepo) : super(const MedicineState.initial());

  static MedicineCubit get(BuildContext context) =>
      BlocProvider.of<MedicineCubit>(context);

  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getMedicine() async {
    emit(const MedicineState.loading());

    final response = await _medicineRepo.getMedicines();
    response.when(
      success: (medicines) {
        getMedicines = medicines;
        emit(const MedicineState.success());
      },
      failure: (errorHandler) {
        emit(const MedicineState.error());
      },
    );
  }

  void emitAddMedicine() async {
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
        await NotificationService().scheduleNotification(
          body: 'تذكير بتناول الدواء: ${nameController.text.trim()}',
          time: timeController.text.trim(),
        );
         
        print('Notification Scheduled for: ${timeController.text.trim()}');

        emit(const MedicineState.addMedicineSuccess());
      },
      failure: (error) {
        emit(const MedicineState.addMedicineError());
      },
    );
  }
}