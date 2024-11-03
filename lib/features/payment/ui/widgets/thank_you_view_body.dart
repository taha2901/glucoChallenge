import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/payment/ui/widgets/custom_check_icon.dart';
import 'package:challenge/features/payment/ui/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';


class ThankYouViewBody extends StatelessWidget {
  final DoctorResponseBody? doctorResponseBody;
  const ThankYouViewBody({super.key, this.doctorResponseBody,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ThankYouCard(
          doctorResponseBody: doctorResponseBody,
        ),
        Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        const Positioned(
          top: -50,
          left: 0,
          right: 0,
          child: CustomCheckIcon(),
        ),
      ],
    );
  }
}
