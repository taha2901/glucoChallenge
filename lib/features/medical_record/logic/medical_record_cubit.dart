import 'package:bloc/bloc.dart';
import 'package:challenge/features/medical_record/data/model/delete_medical_record/delete_medical_record.dart';
import 'package:challenge/features/medical_record/data/model/medical_record/medical_record.dart';
import 'package:challenge/features/medical_record/data/repo/medical_record_repo.dart';
import 'package:challenge/features/medical_record/logic/medical_record_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  final MedicalRecordRepo _medicalRecordRepo;
  MedicalRecord? medicalRecord;
  DeleteMedicalRecord? deleteMedicalRecord;

  MedicalRecordCubit(this._medicalRecordRepo)
      : super(const MedicalRecordState.initial());

  void getMedicalRecord() async {
    if (isClosed) return;
    emit(const MedicalRecordState.loading());

    final response = await _medicalRecordRepo.getMedicalRecord();
    response.when(
      success: (record) {
        medicalRecord = record;
        if (isClosed) return;
        emit(MedicalRecordState.success(responseBody: record));
      },
      failure: (errorModel) {
        if (isClosed) return;
        emit(MedicalRecordState.error(errorModel));
      },
    );
  }

  void getDeleteMedicalRecord() async {
    if (isClosed) return;
    emit(const MedicalRecordState.deleteLoading());

    final response = await _medicalRecordRepo.getDeleteMedicalRecord();
    response.when(
      success: (deleteRecord) {
        deleteMedicalRecord = deleteRecord;
        if (isClosed) return;
        emit(MedicalRecordState.deleteSuccess(responseBody: deleteRecord));
      },
      failure: (errorModel) {
        if (isClosed) return;
        emit(MedicalRecordState.deleteError(errorModel));
      },
    );
  }
}
