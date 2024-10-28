import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doctor.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/form_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/reservation_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorReservation extends StatelessWidget {
  final int doctorId;
  final DoctorResponseBody doctorResponseBody;

  const DoctorReservation({
    super.key,
    required this.doctorResponseBody,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<DoctorsCubit>(),
      child: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          // إضافة منطق للتعامل مع حالات النجاح والفشل
          if (state is ReservationSuccess) {
            showToast(msg: 'تم الحجز بنجاح', state: ToastStates.SUCCESS);
          }
          if (state is ReservationError) {
            showToast(msg: state.apiErrorModel.errors.toString(), state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              child: Column(
                children: [
                  const ReservationAppBar(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: verticalSpace(16),
                        ),
                        SliverToBoxAdapter(
                          child: defineDoctor(
                            doctorResponseBody: doctorResponseBody,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: verticalSpace(64),
                        ),
                        SliverToBoxAdapter(
                          child: FormReservation(doctorId: doctorId),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
