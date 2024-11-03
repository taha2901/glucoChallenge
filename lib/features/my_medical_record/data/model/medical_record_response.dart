import 'package:json_annotation/json_annotation.dart';

part 'medical_record_response.g.dart';

@JsonSerializable()
class MedicalRecordResponse {
  final String username;
  final String phone;
  final int age;
  final String sex;
  final DateTime date;

  MedicalRecordResponse({
    required this.username,
    required this.phone,
    required this.age,
    required this.sex,
    required this.date,
  });

  factory MedicalRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordResponseFromJson(json);
}
