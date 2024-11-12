import 'package:json_annotation/json_annotation.dart';

part 'popular_doctor_response_body.g.dart';

@JsonSerializable()
class PopularDoctorResponseBody {
  int id;
  String userName;
  String phone;
  String email;
  String password;
  String address;
  List<int> workingDays; // حقل جديد
  int detectionPrice;
  String doctorspecialization;
  String photo;
  String about;
  String waitingTime;
  String? startTime; // حقل اختياري
  String? endTime;   // حقل اختياري
  bool favorite;
  int rate;
  int rateCount;
  List<dynamic> users;
  List<dynamic> doctorComments;
  List<String> workingHours; // حقل جديد

  PopularDoctorResponseBody({
    required this.id,
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.workingDays,
    required this.detectionPrice,
    required this.doctorspecialization,
    required this.photo,
    required this.about,
    required this.waitingTime,
    this.startTime, // حقل اختياري
    this.endTime,   // حقل اختياري
    required this.favorite,
    required this.users,
    required this.doctorComments,
    required this.workingHours,
    required this.rate,
    required this.rateCount,
  });

  factory PopularDoctorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PopularDoctorResponseBodyFromJson(json);

}
