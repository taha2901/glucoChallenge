import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_doctors_card.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_name_and_image.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          children: [
            const DoctorAppBar(),
            verticalSpace(16),
            const DoctorTextField(),
            verticalSpace(16),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      'المتاحيين',
                      style: TextStyles.font18BlackMedium,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: DoctorNameAndImage(),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(8),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'جميع الأطباء',
                      style: TextStyles.font18BlackMedium,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const AllDoctorsCard();
                      },
                    ),
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
