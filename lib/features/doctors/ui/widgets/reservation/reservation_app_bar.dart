import 'package:challenge/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationAppBar extends StatelessWidget {
  const ReservationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
        const Text(
          'حجز',
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
            child: Image.asset(
          'assets/images/delete.png',
          height: 50.h,
          width: 50.w,
        ))
      ],
    );
  }
}
