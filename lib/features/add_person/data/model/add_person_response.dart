import 'package:json_annotation/json_annotation.dart';

part 'add_person_response.g.dart';

@JsonSerializable()
class AddPersonResponse {
  final int id;
  final String email;
  final String phone;
  final String relvantRelation;
  // final String userId;
  // final List<dynamic> users;

  AddPersonResponse({
    required this.id,
    required this.email,
    required this.phone,
    required this.relvantRelation,
    // required this.userId,
    // required this.users,
  });

  factory AddPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPersonResponseFromJson(json);
}
