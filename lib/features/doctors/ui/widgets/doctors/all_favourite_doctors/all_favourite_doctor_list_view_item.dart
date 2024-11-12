import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllFavouriteDoctorListViewItem extends StatelessWidget {
  final FavouriteDoctorResponse? favouritesData;

  const AllFavouriteDoctorListViewItem({
    super.key,
    this.favouritesData,
  });

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
                child: Image.network(
                  fit: BoxFit.fitHeight,
                  favouritesData!.doctor!.photo.toString(),
                ),
              ),
            ),
            verticalSpace(8.h),
            Text(
              favouritesData!.doctor!.userName.toString(),
              style: TextStyles.font13BlackBold,
            ),
            Text(
              favouritesData!.doctor!.doctorspecialization.toString(),
              style: TextStyles.font13Blackmedium,
            ),
          ],
        ),
      ),
    );
  }
}
