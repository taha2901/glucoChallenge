import 'package:json_annotation/json_annotation.dart';

part 'add_or_remove_doctor_favourite_request.g.dart';

@JsonSerializable()
class AddOrRemoveFavouriteRequestModel {
  final int doctorId;
  final String userId;

  AddOrRemoveFavouriteRequestModel({
    required this.doctorId,
    required this.userId,
  });

  Map<String, dynamic> toJson() =>
      _$AddOrRemoveFavouriteRequestModelToJson(this);
}
