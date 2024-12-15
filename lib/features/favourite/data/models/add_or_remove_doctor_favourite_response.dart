import 'package:json_annotation/json_annotation.dart';

part 'add_or_remove_doctor_favourite_response.g.dart';

@JsonSerializable()
class AddOrRemoveFavouriteResponseModel {
  final String message;

  AddOrRemoveFavouriteResponseModel({required this.message});

  factory AddOrRemoveFavouriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrRemoveFavouriteResponseModelFromJson(json);
}
