// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_favourite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorFavouriteResponse _$GetDoctorFavouriteResponseFromJson(
        Map<String, dynamic> json) =>
    GetDoctorFavouriteResponse(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String,
      doctorspecialization: json['doctorspecialization'] as String,
      about: json['about'] as String,
      address: json['address'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$GetDoctorFavouriteResponseToJson(
        GetDoctorFavouriteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'doctorspecialization': instance.doctorspecialization,
      'about': instance.about,
      'address': instance.address,
      'photo': instance.photo,
    };
