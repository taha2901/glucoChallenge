// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordResponse _$MedicalRecordResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordResponse(
      username: json['username'] as String,
      phone: json['phone'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$MedicalRecordResponseToJson(
        MedicalRecordResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'phone': instance.phone,
      'age': instance.age,
      'sex': instance.sex,
      'date': instance.date.toIso8601String(),
    };
