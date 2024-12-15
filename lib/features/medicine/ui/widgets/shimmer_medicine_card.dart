import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';

class ShimmerMedicineCard extends StatelessWidget {
  const ShimmerMedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const ShimmerMedicineListItem(),
        itemCount: 5);
  }
}

class ShimmerMedicineListItem extends StatelessWidget {
  const ShimmerMedicineListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card(
          elevation: 5,
          shadowColor: ColorsManager.kPrimaryColor,
          color: ColorsManager.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // محاكاة الصورة (في مكان صورة الدواء)
                Container(
                  color: Colors.grey,
                ),
                verticalSpace(8),
                // محاكاة اسم الدواء (محاكاة النص في السطر الأول)
                Container(
                  height: 20,
                  width: 150,
                  color: Colors.grey,
                ),
                verticalSpace(8),
                // محاكاة جرعة الدواء (محاكاة النص في السطر الثاني)
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 80,
                      color: Colors.grey,
                    ),
                    horizontalSpace(5),
                    Container(
                      height: 15,
                      width: 60,
                      color: Colors.grey,
                    ),
                  ],
                ),
                verticalSpace(8),
                // محاكاة الأيقونة (محاكاة أيقونة الحذف)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
