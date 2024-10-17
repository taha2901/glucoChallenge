import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineAppBar extends StatelessWidget {
 final void Function()? onPressed;
  const MedicineAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressed ,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        Text('مواعيد الأدوية', style: TextStyles.font18BlackMedium),
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
