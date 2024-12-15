import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/popular_doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorNameAndImageItem extends StatelessWidget {
  const PopularDoctorNameAndImageItem({
    super.key,
    required this.doctor,
  });

  final PopularDoctorResponseBody? doctor;

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      width: 125.w,
      child: Card(
        color: ColorsManager.mainCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130.h,
              width: 130.w,
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
            verticalSpace(6.h),
            Row(
              children: [
                Text(
                  doctor!.userName.toString(),
                  style: TextStyles.font13BlackBold,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18.sp,
                        color: Colors.amber,
                      ),
                      Text(
                        doctor!.rate.toString(),
                        style: TextStyles.font13BlackBold,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                doctor!.doctorspecialization.toString(),
                style: TextStyles.font13Blackmedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
