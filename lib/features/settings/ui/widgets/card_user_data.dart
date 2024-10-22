import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/features/settings/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class CardOfUserData extends StatelessWidget {
  const CardOfUserData({
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
                  Text(
                    "${ProfileCubit.get(context).profileModelList?.username}",
                    style: TextStyles.font16BlackBold,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Text(
                        "${ProfileCubit.get(context).profileModelList?.email}",
                        style: TextStyles.font14LightGreyRegular,
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Text(
                    "${ProfileCubit.get(context).profileModelList?.phone}",
                    style: TextStyles.font14LightGreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                child: CircleAvatar(
                  radius: 50.sp,
                  child: Icon(
                    Icons.person,
                    size: 60.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
