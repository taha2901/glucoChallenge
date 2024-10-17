import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsCard extends StatelessWidget {
  final DoctorResponseBody doctorResponseBody;
  const AllDoctorsCard({
    super.key,
    required this.doctorResponseBody,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsManager.mainColor,
      elevation: 3,
      color: ColorsManager.mainCardColor,
      borderOnForeground: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 95.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  fit: BoxFit.cover,
                  doctorResponseBody.photo.toString(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorResponseBody.userName.toString(),
                  style: TextStyles.font13BlackBold,
                ),
                Text(
                  doctorResponseBody.doctorspecialization.toString(),
                  style: TextStyles.font13GreyRegular,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routers.doctorResrvation,
                      arguments: doctorResponseBody); // 1 - send doctor response
                },
                child: const CircleAvatar(
                  backgroundColor: ColorsManager.mainColor,
                  radius: 15,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
