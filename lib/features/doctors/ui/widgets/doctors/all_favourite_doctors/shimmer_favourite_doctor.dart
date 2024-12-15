import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';

class ShimmerDoctorList extends StatelessWidget {
  const ShimmerDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // عدد العناصر الوهمية
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ShimmerDoctorItem(),
        ),
      ),
    );
  }
}

class ShimmerDoctorItem extends StatelessWidget {
  const ShimmerDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 125.w,
      child: Card(
        color: ColorsManager.mainCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125.h,
                width: 125.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.mainColor,
                ),
              ),
              verticalSpace(8.h),
              Container(
                height: 15.h,
                width: 80.w,
                color: Colors.grey,
              ),
              verticalSpace(4.h),
              Container(
                height: 15.h,
                width: 100.w,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
