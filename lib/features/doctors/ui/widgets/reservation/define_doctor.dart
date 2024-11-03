import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class defineDoctor extends StatelessWidget {
  final DoctorResponseBody doctorResponseBody;


  const defineDoctor({
    super.key,
    required this.doctorResponseBody,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Center(
              child: ClipOval(
                child: SizedBox(
                  width: 100.r,
                  height: 100.r,
                  child: Image.network(
                    doctorResponseBody.photo.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )),
            verticalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorResponseBody.userName.toString(),
                  style: TextStyles.font18BlueBold,
                ),
                Text(
                  doctorResponseBody.doctorspecialization.toString(),
                  style: TextStyles.font15DarkSemiBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      doctorResponseBody.address.toString(),
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      doctorResponseBody.endTime.toString(),
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.shopping_cart_checkout_sharp,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      "سعر الكشف",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    Text(
                      doctorResponseBody.detectionPrice.toString(),
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      "مده الانتظار",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    Text(
                      doctorResponseBody.waitingTime.toString(),
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
              ],
            ),
            horizontalSpace(5),
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
