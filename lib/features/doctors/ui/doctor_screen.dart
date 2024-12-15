import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_doctors_list_view.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_famous_doctors/all_popular_doctors.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_favourite_doctors/all_favourite_doctor.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_text_field.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/logic/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({
    super.key,
  });

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
                      'الأكثر شهرة',
                      style: TextStyles.font18BlackMedium,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: AllPopularDoctors(),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(8),
                  ),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      if (FavouriteCubit.of(context)
                          .favouriteList
                          .isNotEmpty) {
                        return SliverToBoxAdapter(
                          child: Text(
                            'المفضلة',
                            style: TextStyles.font18BlackMedium,
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: SizedBox
                            .shrink(), // لا تعرض شيء إذا كانت القائمة فارغة
                      );
                    },
                  ),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      if (FavouriteCubit.of(context)
                          .favouriteList
                          .isNotEmpty) {
                        return SliverToBoxAdapter(
                          child: verticalSpace(8),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: SizedBox
                            .shrink(), // لا تعرض شيء إذا كانت القائمة فارغة
                      );
                    },
                  ),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      if (FavouriteCubit.of(context)
                          .favouriteList
                          .isNotEmpty) {
                        return SliverToBoxAdapter(
                          child: Container(
                            height: 200.h,
                            child: const AllFavouriteDoctor(),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: SizedBox
                            .shrink(), // لا تعرض شيء إذا كانت القائمة فارغة
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'المتاحين',
                      style: TextStyles.font18BlackMedium,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: AllDoctorsListView(),
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
