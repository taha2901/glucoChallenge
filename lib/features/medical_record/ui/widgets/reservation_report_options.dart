
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class ReservationsReportOptions extends StatelessWidget {
  const ReservationsReportOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 40.h,
              decoration: const BoxDecoration(
                color: ColorsManager.kPrimaryLightColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(8),
                  bottomStart: Radius.circular(8),
                ),
              ),
              child: Center(child: Text('حجوزات دكاتره',style: TextStyles.font18BlackMedium)),
            ),
          ),
          horizontalSpace(1),
          Expanded(
            child: Container(
              height: 40.h,
              decoration: const BoxDecoration(
                color: ColorsManager.kPrimaryLightColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(8),
                  topEnd: Radius.circular(8),
                ),
                
              ),
              child:  Center(child: Text('تقرير',style: TextStyles.font18BlackMedium)),
            ),
          ),
        ],
      ),
    );
  }
}
