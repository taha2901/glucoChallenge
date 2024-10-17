part of 'measurments_cubit.dart';

@freezed
class MeasurmentsState with _$MeasurmentsState {
  const factory MeasurmentsState.initial() = _Initial;
  // blood suger
  const factory MeasurmentsState.addBloodSugerLoading() = AddBloodSugerLoading;
  const factory MeasurmentsState.addBloodSugerSuccess() = AddBloodSugerSuccess;
  const factory MeasurmentsState.addBloodSugerError({required String error}) = AddBloodSugerError;

  // blood pressure
  const factory MeasurmentsState.addBloodPressureLoading() =
      AddBloodPressureLoading;
  const factory MeasurmentsState.addBloodPressureSuccess() =
      AddBloodPressureSuccess;
  const factory MeasurmentsState.addBloodPressureError() =
      AddBloodPressureError;

  // weight
  const factory MeasurmentsState.addWeightLoading() = AddWeightLoading;
  const factory MeasurmentsState.addWeightSuccess() = AddWeightSuccess;
  const factory MeasurmentsState.addWeightError() = AddWeightError;
}
