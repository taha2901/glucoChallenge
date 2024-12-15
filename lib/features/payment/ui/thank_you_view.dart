import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/build_appbar.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/payment/ui/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  final DoctorResponseBody? doctorResponseBody;
  
  const ThankYouView({super.key, this.doctorResponseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildApBar(),
              verticalSpace(32),
              Transform.translate(
                  offset: const Offset(0, -16),
                  child: ThankYouViewBody(
                    doctorResponseBody: doctorResponseBody,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
