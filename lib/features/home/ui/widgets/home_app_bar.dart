import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(Routers.profile),
          child: CircleAvatar(
            radius: 25.r,
          ),
        ),
        horizontalSpace(8),
        Column(
          children: [
            Text(
              'أهلا',
              style: TextStyles.font17GreySemiBold,
            ),
            Text(
              'طه حماده',
              style: TextStyles.font17GreySemiBold,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          
          child: Image.asset(
            'assets/images/messenger.png',
            height: 55.h,
            width: 55.w,
          ),
        ),
        GestureDetector(
          child: Image.asset(
            'assets/images/notification.png',
            height: 55.h,
            width: 55.w,
          ),
        ),
      ],
    );
  }
}
