import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/home/ui/widgets/custom_app_bar.dart';
import 'package:challenge/features/home/ui/widgets/data_in_home.dart';
import 'package:challenge/features/home/ui/widgets/tick_heart.dart';
import 'package:challenge/features/home/ui/widgets/tick_services.dart';
import 'package:challenge/features/home/ui/widgets/two_square_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleDateChange(DateTime selectedDate) {
    // تنفيذ أي عملية عند تغيير التاريخ
    print('التاريخ المحدد: ${selectedDate.toLocal()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: CustomScrollView(
          slivers: [
             SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            const SliverToBoxAdapter(
              child: CustomAppBar(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            SliverToBoxAdapter(
              child: AppTextFormField(
                hintText: 'بحث',
                textAlign: TextAlign.center,
                borderRadius: BorderRadius.circular(10),
                suffixIcon: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Image.asset(
                      'assets/images/Iconly.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
                prefixIcon:  Icon(
                  Icons.search,
                  size: 35.sp,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            SliverToBoxAdapter(
              child: Text(
                'تتبع الانشطه',
                style: TextStyles.font17GreySemiBold,
              ),
            ),
            SliverToBoxAdapter(
              child: MyTimeLineHome(
                onDateChange: _handleDateChange,
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(8),
            ),
            const SliverToBoxAdapter(
              child: Pulseindicator(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(12),
            ),
            SliverToBoxAdapter(
              child: TicksOfHeart(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(18),
            ),
            SliverToBoxAdapter(
              child: Text(
                'الخدمات',
                style: TextStyles.font15greyBold,
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(8),
            ),
            const SliverToBoxAdapter(
              child: TicksOfServices(),
            ),
          ],
        ),
      ),
    );
  }
}
