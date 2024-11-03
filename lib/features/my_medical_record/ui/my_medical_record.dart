import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/features/my_medical_record/ui/widgets/app_bar_of_medical_record.dart';
import 'package:challenge/features/my_medical_record/ui/widgets/reservation_report_options.dart';
import 'package:flutter/material.dart';

class MyMedicalRecord extends StatelessWidget {
  const MyMedicalRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfMedicalRecord(),
            verticalSpace(8),
            const ReservationsReportOptions(),
            verticalSpace(8),
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: ColorsManager.lightBlue,
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         child: Center(
            //           child: ClipOval(
            //             child: SizedBox(
            //               width: 100.r,
            //               height: 100.r,
            //               child: Image.network(
            //                 doctorResponseBody.photo,
            //                 fit: BoxFit.contain,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       verticalSpace(8),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             doctorResponseBody.userName,
            //             style: TextStyles.font18BlueBold,
            //           ),
            //           Text(
            //             doctorResponseBody.doctorspecialization,
            //             style: TextStyles.font15DarkSemiBold,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               const Icon(
            //                 Icons.location_on_sharp,
            //                 size: 15,
            //               ),
            //               horizontalSpace(5),
            //               Text(
            //                 doctorResponseBody.address,
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               const Icon(
            //                 Icons.calendar_today,
            //                 size: 15,
            //               ),
            //               horizontalSpace(5),
            //               Text(
            //                 doctorResponseBody.endTime.toString(),
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               const Icon(
            //                 Icons.shopping_cart_checkout_sharp,
            //                 size: 15,
            //               ),
            //               horizontalSpace(5),
            //               Text(
            //                 "سعر الكشف",
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //               Text(
            //                 doctorResponseBody.detectionPrice.toString(),
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               const Icon(
            //                 Icons.timer_outlined,
            //                 size: 15,
            //               ),
            //               horizontalSpace(5),
            //               Text(
            //                 "مده الانتظار",
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //               Text(
            //                 doctorResponseBody.waitingTime,
            //                 style: TextStyles.font15DarkBlueMedium,
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       horizontalSpace(5),
            //       const Icon(
            //         Icons.cancel_outlined,
            //         color: Colors.red,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
