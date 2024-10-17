import 'package:json_annotation/json_annotation.dart';

part 'doctor_response_body.g.dart';



@JsonSerializable()
class DoctorResponseBody {
  int id;
  String userName;
  String phone;
  String email;
  String password;
  String address;
  String appointment;
  int detectionPrice;
  String doctorspecialization;
  String photo;
  String about;
  String waitingTime;
  bool favorite;
  List<dynamic> users;
  List<dynamic>
      doctorComments;

  DoctorResponseBody({
    required this.id,
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.appointment,
    required this.detectionPrice,
    required this.doctorspecialization,
    required this.photo,
    required this.about,
    required this.waitingTime,
    required this.favorite,
    required this.users,
    required this.doctorComments,
  });

  factory DoctorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorResponseBodyToJson(this);
}
