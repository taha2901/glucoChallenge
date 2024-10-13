
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorNameAndImage extends StatelessWidget {
  const DoctorNameAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
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
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/images/doctor.png',
                      ),
                    ),
                  ),
                  verticalSpace(
                      8.h), 
                  Text(
                    'علي أبوبكر',
                    style: TextStyles.font13BlackBold,
                  ),
                  Text(
                    'باطنه',
                    style: TextStyles.font13Blackmedium,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
