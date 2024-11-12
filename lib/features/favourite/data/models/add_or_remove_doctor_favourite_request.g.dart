// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_remove_doctor_favourite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrRemoveFavouriteRequestModel _$AddOrRemoveFavouriteRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddOrRemoveFavouriteRequestModel(
      doctorId: (json['doctorId'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$AddOrRemoveFavouriteRequestModelToJson(
        AddOrRemoveFavouriteRequestModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'userId': instance.userId,
    };
