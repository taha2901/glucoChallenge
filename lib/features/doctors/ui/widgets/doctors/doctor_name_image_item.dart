import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class DoctorNameAndImageItem extends StatelessWidget {
  const DoctorNameAndImageItem({
    super.key,
    required this.doctor,
  });

  final DoctorResponseBody? doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 125.w,
      child: Card(
        color: ColorsManager.mainCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 125.h,
              width: 125.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.mainColor,
              ),
              child: Center(
                child: Image.network(
                  fit: BoxFit.fitHeight,
                  doctor!.photo.toString(),
                ),
              ),
            ),
            verticalSpace(8.h),
            Text(
              doctor!.userName.toString(),
              style: TextStyles.font13BlackBold,
            ),
            Text(
              doctor!.doctorspecialization.toString(),
              style: TextStyles.font13Blackmedium,
            ),
          ],
        ),
      ),
    );
  }
}
