part of 'medicine_cubit.dart';

@freezed
class MedicineState with _$MedicineState {
  const factory MedicineState.initial() = _Initial;
  const factory MedicineState.loading() = MedicineLoading;
  const factory MedicineState.success() = MedicineSuccess;
  const factory MedicineState.error() = MedicineError;

  const factory MedicineState.addMedicineLoading() = AddMedicineLoading;
  const factory MedicineState.addMedicineSuccess() = AddMedicineSuccess;
  const factory MedicineState.addMedicineError() = AddMedicineError;
}
