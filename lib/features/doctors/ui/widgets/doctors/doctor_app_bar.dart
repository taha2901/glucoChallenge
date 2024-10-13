
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_ios_new_rounded),
        Text(
          'دكتور',
          style: TextStyles.font18BlackMedium,
        ),
        GestureDetector(
          child: Image.asset(
            'assets/images/notification.png',
            height: 50.h,
            width: 50.w,
          ),
        )
      ],
    );
  }
}
