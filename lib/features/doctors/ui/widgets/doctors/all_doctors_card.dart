import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsCard extends StatelessWidget {
  const AllDoctorsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsManager.mainColor,
      elevation: 3,
      color: ColorsManager.mainCardColor,
      borderOnForeground: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 95.h,
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
              child: Center(
                child: Image.asset(
                  fit: BoxFit.cover,
                  'assets/images/doctor.png',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دكتور محمد',
                  style: TextStyles.font13BlackBold,
                ),
                Text(
                  'اخصائي بطنه و متابعة سكر',
                  style: TextStyles.font13GreyRegular,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => context.pushNamed(Routers.doctorResrvation),
                child: const CircleAvatar(
                  backgroundColor: ColorsManager.mainColor,
                  radius: 15,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
