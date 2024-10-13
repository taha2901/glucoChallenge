import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doctor.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/form_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/reservation_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorReservation extends StatelessWidget {
  const DoctorReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: ReservationAppBar(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            const SliverToBoxAdapter(
              child: defineDoctor(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(64),
            ),
            const SliverToBoxAdapter(
              child: FormReservation(),
            )
          ],
        ),
      ),
    );
  }
}
