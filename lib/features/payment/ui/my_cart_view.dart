import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/payment/ui/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  final String? username;
  final String? sex;
  final int? age;
  final String? phone;
  final String? time;
  final int? doctorId;
  final String? selectedDate;
  final DoctorResponseBody? doctorResponseBody;

  const MyCartView({
    super.key,
    this.username,
    this.sex,
    this.age,
    this.phone,
    this.doctorId,
    this.time,
    this.selectedDate,
    this.doctorResponseBody,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MyCartViewBody(
          doctorResponseBody: doctorResponseBody,
          age: age,
          doctorId: doctorId,
          phone: phone,
          sex: sex,
          username: username,
          time: time,
          selectedDate: selectedDate.toString(),
        ),
      ),
    );
  }
}
