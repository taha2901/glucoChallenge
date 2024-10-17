import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/home/ui/widgets/home_app_bar.dart';
import 'package:challenge/features/home/ui/widgets/data_in_home.dart';
import 'package:challenge/features/home/ui/widgets/home_text_field.dart';
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
        child: Column(
          children: [
            verticalSpace(16),
            const CustomAppBar(),
            verticalSpace(16),
            const HomeTextField(),
            Expanded(
              child: CustomScrollView(
                slivers: [
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
          ],
        ),
      ),
    );
  }
}
