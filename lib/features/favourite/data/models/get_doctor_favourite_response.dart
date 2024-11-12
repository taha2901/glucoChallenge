import 'package:json_annotation/json_annotation.dart';

part 'get_doctor_favourite_response.g.dart';

@JsonSerializable()
class GetDoctorFavouriteResponse {
  final int id;
  final String userName;
  final String doctorspecialization;
  final String about;
  final String address;
  final String photo;

  GetDoctorFavouriteResponse({
    required this.id,
    required this.userName,
    required this.doctorspecialization,
    required this.about,
    required this.address,
    required this.photo,
  });

  factory GetDoctorFavouriteResponse.fromJson(Map<String, dynamic> json) => _$GetDoctorFavouriteResponseFromJson(json);

}
