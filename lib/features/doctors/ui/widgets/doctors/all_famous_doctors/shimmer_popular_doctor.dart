import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/helpers/spacing.dart';

class ShimmerPopularDoctorsList extends StatelessWidget {
  const ShimmerPopularDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26, // ارتفاع العنصر لتلائم ارتفاع بطاقة الطبيب
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // عدد العناصر الوهمية لعرضها في قائمة التحميل
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ShimmerPopularDoctorItem(),
        ),
      ),
    );
  }
}

class ShimmerPopularDoctorItem extends StatelessWidget {
  const ShimmerPopularDoctorItem({super.key});

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
              Row(
                children: [
                  Container(
                    height: 15.h,
                    width: 80.w,
                    color: Colors.grey,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          height: 15.h,
                          width: 20.w,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
