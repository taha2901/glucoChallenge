// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPersonResponse _$AddPersonResponseFromJson(Map<String, dynamic> json) =>
    AddPersonResponse(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      phone: json['phone'] as String,
      relvantRelation: json['relvantRelation'] as String,
    );

Map<String, dynamic> _$AddPersonResponseToJson(AddPersonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'relvantRelation': instance.relvantRelation,
    };
