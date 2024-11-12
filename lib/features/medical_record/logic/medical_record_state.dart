import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/features/medical_record/data/model/delete_medical_record/delete_medical_record.dart';
import 'package:challenge/features/medical_record/data/model/medical_record/medical_record.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_record_state.freezed.dart';

@freezed
class MedicalRecordState with _$MedicalRecordState {
  const factory MedicalRecordState.initial() = _Initial;
  const factory MedicalRecordState.loading() = MedicalRecordLoading;
  const factory MedicalRecordState.success({required MedicalRecord responseBody}) = MedicalRecordSuccess;
  const factory MedicalRecordState.error(ApiErrorModel apiErrorModel) = MedicalRecordError;


  //delete medical record
  const factory MedicalRecordState.deleteLoading() =  MedicalRecordDeleteLoading;
  const factory MedicalRecordState.deleteSuccess({required DeleteMedicalRecord responseBody}) =  MedicalRecordDeleteSuccess;
  const factory MedicalRecordState.deleteError(ApiErrorModel apiErrorModel) =  MedicalRecordDeleteError;
}

