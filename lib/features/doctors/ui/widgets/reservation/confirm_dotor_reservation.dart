import 'package:challenge/core/di/dependency_injection.dart';
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
  final String? time;
  final int? doctorId;

  const ConfirmDoctorReservation({
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

  // @override
  // void initState() {
  //   super.initState();
  //   // التحقق من doctorId قبل الاستدعاء
  //   if (widget.doctorId != null) {
  //     BlocProvider.of<DoctorsCubit>(context).getAvailableTime(
  //       widget.doctorId!,
  //       // DateFormat('MM/dd/yyyy').format(DateTime.now()),
  //       DateTime.now(),
  //     );
  //   }
  // }

  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
      print(
          "Doctor ID: ${widget.doctorId}, Date: ${DateFormat('MM/dd/yyyy').format(_selectedDate!)}");

      // استدعاء getAvailableTime بعد تحديد التاريخ
      if (widget.doctorId != null) {
        context.read<DoctorsCubit>().getAvailableTime(
              widget.doctorId!,
              // DateFormat('MM/dd/yyyy').format(_selectedDate!),
              _selectedDate!,
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
            // تمرير onDateChange لاختيار التاريخ
            DateSelectionPage(onDateChange: _onDateChange),
            BlocProvider(
              create: (context) => getit<DoctorsCubit>()
                ..getAvailableTime(widget.doctorId!,
                    // DateFormat('yyyy-MM-dd').format(DateTime.now())),
                    _selectedDate!),
              child: BlocConsumer<DoctorsCubit, DoctorsState>(
                listener: (context, state) {
                  if (state is AvailableTimeError) {
                    // عرض رسالة للمستخدم عند حدوث خطأ
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('حدث خطأ: ${state.apiErrorModel.title}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AvailableTimeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AvailableTimeSuccess &&
                      _selectedDate != null) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.availableTimeResponse.availableTimes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100.w,
                            height: 100.h,
                            child: Card(
                              child: Center(
                                child: Text(
                                  state.availableTimeResponse
                                      .availableTimes[index].toString(),
                                  
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                        child: Text('يرجى تحديد التاريخ أولاً'));
                  }
                },
              ),
            ),
            const Spacer(),
            AppTextButton(
              borderRadius: 10,
              buttonText: 'تأكيد',
              textStyle: TextStyles.font18WhiteBold,
              onPressed: () {
                if (_selectedDate != null) {
                  context.read<DoctorsCubit>().emitReservationStates(
                        username: widget.username.toString(),
                        phone: widget.phone.toString(),
                        age: widget.age ?? 0,
                        sex: widget.sex.toString(),
                        date: DateFormat('MM/dd/yyyy').format(_selectedDate!),
                        doctorId: widget.doctorId!,
                        time: widget.time!,
                      );
                } else {
                  // عرض رسالة للمستخدم لتحديد التاريخ
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('يرجى تحديد التاريخ أولاً')),
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
