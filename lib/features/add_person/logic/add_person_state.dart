import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/features/add_person/data/model/add_person_model.dart';
import 'package:challenge/features/add_person/data/model/add_person_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_person_state.freezed.dart';

@freezed
class AddPersonState with _$AddPersonState {
  const factory AddPersonState.initial() = _Initial;
  const factory AddPersonState.addPersonLoading() = AddPErsonLoading;
  const factory AddPersonState.addPersonSuccess(
      {required AddPersonModel addPerson}) = AddPersonSuccess;
  const factory AddPersonState.addPersonError(ApiErrorModel apiErrorModel) =
      AddPersonError;
}
