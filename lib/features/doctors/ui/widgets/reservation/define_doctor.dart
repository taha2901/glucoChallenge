import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class defineDoctor extends StatelessWidget {
  const defineDoctor({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ClipOval(
              child: SizedBox(
                width: 100.r, // ضعف حجم radius
                height: 100.r, // ضعف حجم radius
                child: Image.asset(
                  'assets/images/doctor.png',
                  fit: BoxFit.contain,
                ),
              ),
            )),
            verticalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'د. سعيد الحسيني',
                  style: TextStyles.font18BlueBold,
                ),
                Text(
                  'استشاري جراحه و المسالك البوليه',
                  style: TextStyles.font15DarkSemiBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      '16-شارع جمال عبدالناصر',
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      'الاحد  8-9-2023  8:30 م',
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.shopping_cart_checkout_sharp,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      "سعر الكشف",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    Text(
                      " 100 جنيه ",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 15,
                    ),
                    horizontalSpace(5),
                    Text(
                      "مده الانتظار",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    Text(
                      " : 20 دقيقه",
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                  ],
                ),
              ],
            ),
            horizontalSpace(5),
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
