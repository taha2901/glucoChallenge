import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerAllDoctorsCard extends StatelessWidget {
  const ShimmerAllDoctorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsManager.mainColor,
      elevation: 3,
      color: ColorsManager.mainCardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 95.h,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
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
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15.h,
                    width: 100.w,
                    color: Colors.grey,
                  ),
                  verticalSpace(8.h),
                  Container(
                    height: 15.h,
                    width: 80.w,
                    color: Colors.grey,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      color: Colors.grey,
                    ),
                    verticalSpace(10),
                    CircleAvatar(
                      backgroundColor: ColorsManager.mainColor,
                      radius: 15,
                      child: Container(
                        height: 15.h,
                        width: 15.w,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
