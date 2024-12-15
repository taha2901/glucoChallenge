import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerCardOfUserData extends StatelessWidget {
  const ShimmerCardOfUserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ColorsManager.kPrimaryLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 120.w,
                      height: 20.h,
                      color: Colors.white,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 150.w,
                          height: 16.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 100.w,
                      height: 16.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: CircleAvatar(
                  radius: 50.sp,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
