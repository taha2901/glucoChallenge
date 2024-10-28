import 'package:bloc/bloc.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/weight_request_model.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';
import 'package:challenge/features/measurments/data/repo/weight_measurment_repo.dart';
import 'package:challenge/features/measurments/logic/weight/weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  final WeightMeasurmentRepo _measurmentRepo;
  WeightCubit(this._measurmentRepo) : super(const WeightState.initial());

  List<WeightMeasurement> weightMeasurements = [];


// Add Weight
  void emitAddWeight(int weight, String? activity) async {
    if (isClosed) return;
    emit(const WeightState.addWeightLoading());

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

        emit(const WeightState.addWeightSuccess());
      },
      failure: (error) {
        if (isClosed) return;
        emit(const WeightState.addWeightError());
      },
    );
  }

  //get weight
  Future<void> fetchWeightData(String specificDate) async {
    if (isClosed) return;
    emit(const WeightState.getWeightLoading());
    final response = await _measurmentRepo.getWeight(specificDate);
    response.when(success: (weight) async {
      weightMeasurements = weight.toList();
      if (isClosed) return;
      emit(
          WeightState.getWeightSuccess(weightMeasurements: weightMeasurements));
    }, failure: (error) {
      if (isClosed) return;
      emit(WeightState.getWeightError(error: error.toString()));
    });
  }
}
