import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doc_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_reservation_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/time_line_cal_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ConfirmDoctorReservation extends StatefulWidget {
  final String? username;
  final String? sex;
  final int? age;
  final String? phone;
  String? time;
  final int? doctorId;

  ConfirmDoctorReservation({
    super.key,
    this.username,
    this.sex,
    this.age,
    this.phone,
    this.time,
    this.doctorId,
  });

  @override
  State<ConfirmDoctorReservation> createState() =>
      _ConfirmDoctorReservationState();
}

class _ConfirmDoctorReservationState extends State<ConfirmDoctorReservation> {
  DateTime? _selectedDate;

  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(selectedDate); // تغيير تنسيق التاريخ

      // استدعاء getAvailableTime بعد تحديد التاريخ
      if (widget.doctorId != null) {
        context.read<DoctorsCubit>().getAvailableTime(
              widget.doctorId!,
              formattedDate, // تمرير التاريخ كـ String
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConfirmReservationAppBar(),
            const DefineInReservation(),
            Text(
              'الأيام',
              style: TextStyles.font15DarkSemiBold,
            ),
            DateSelectionPage(onDateChange: _onDateChange),
            verticalSpace(16),
            BlocBuilder<DoctorsCubit, DoctorsState>(builder: (context, state) {
              if (_selectedDate == null) {
                return const Center(child: Text('يرجى تحديد التاريخ أولاً'));
              }

              return BlocConsumer<DoctorsCubit, DoctorsState>(
                listener: (context, state) {
                  if (state is AvailableTimeLoading) {
                    const Center(child: CircularProgressIndicator());
                  }
                  if (state is AvailableTimeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'حدث خطأ: ${state.apiErrorModel.getAllErrorMessages()}')),
                    );
                  }
                  if (state is ReservationSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarAnimationStyle: AnimationStyle(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeIn,
                        reverseCurve: Curves.easeOut,
                        reverseDuration: const Duration(seconds: 1),
                      ),
                      SnackBar(
                          backgroundColor: Colors.green,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(10),
                          content: Text(
                              'تم الحجز بنجاح: ${state.reservationResponse.message}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AvailableTimeSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.availableTimeResponse.availableTimes.length,
                        itemBuilder: (context, index) {
                          String timeStr =
                              state.availableTimeResponse.availableTimes[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.time = timeStr; // حفظ الوقت كـ String
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (widget.time == timeStr)
                                    ? Colors.blueAccent
                                    : Colors.grey.shade300,
                              ),
                              width: 100.w,
                              height: 100.h,
                              child: Center(
                                child: Text(
                                  timeStr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (widget.time == timeStr)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  else {
                    return const Center(child: Text(''));
                  }
                },
              );
            }),
            const Spacer(),
            AppTextButton(
              borderRadius: 10,
              buttonText: 'تأكيد',
              textStyle: TextStyles.font18WhiteBold,
              onPressed: () {
                if (_selectedDate != null && widget.time != null) {
                  context.read<DoctorsCubit>().emitReservationStates(
                        username: widget.username.toString(),
                        phone: widget.phone.toString(),
                        age: widget.age ?? 0,
                        sex: widget.sex.toString(),
                        date: DateFormat('yyyy-MM-dd').format(
                            _selectedDate!), // استخدام تنسيق صحيح للتاريخ
                        doctorId: widget.doctorId!,
                        time: widget.time!,
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('يرجى تحديد التاريخ والوقت أولاً')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
