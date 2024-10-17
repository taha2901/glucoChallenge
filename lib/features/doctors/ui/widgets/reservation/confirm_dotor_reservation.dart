import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doc_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_reservation_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/time_line_cal_one.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
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
  const ConfirmDoctorReservation(
      {super.key,
      this.username,
      this.sex,
      this.age,
      this.phone,
      this.time,
      this.doctorId});

  @override
  State<ConfirmDoctorReservation> createState() =>
      _ConfirmDoctorReservationState();
}

class _ConfirmDoctorReservationState extends State<ConfirmDoctorReservation> {
  DateTime? _selectedDate;
  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
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
            verticalSpace(8),
            const DefineInReservation(),
            Text(
              'الأيام',
              style: TextStyles.font15DarkSemiBold,
            ),
            DateSelectionPage(onDateChange: _onDateChange),
            const Spacer(),
            AppTextButton(
              borderRadius: 10,
              buttonText: 'تأكيد',
              textStyle: TextStyles.font18WhiteBold,
              onPressed: () {
                // if (reservationData != null) {
                //   // هنا يمكنك استخدام البيانات المرسلة
                //   print('Doctor ID: ${reservationData!['doctorId']}');
                //   print('Selected Date: $_selectedDate');

                //   // إذا كنت تريد تنفيذ عملية الحجز بناءً على البيانات
                //   DoctorsCubit.get(context).emitReservationStates(
                //     reservationData!['doctorId'] as int,
                //     // يمكنك تمرير البيانات الأخرى كما تريد
                //   );
                // } else {
                //   // إذا لم يتم استلام بيانات، طباعة رسالة خطأ أو إظهار تنبيه للمستخدم
                //   print('Error: No reservation data found.');
                // }

                DoctorsCubit.get(context).emitReservationStates(
                  username: context.read<DoctorsCubit>().nameController.text,
                  phone: context.read<DoctorsCubit>().phoneController.text,
                  age: int.tryParse(
                          context.read<DoctorsCubit>().ageController.text) ??
                      0,
                  sex: context.read<DoctorsCubit>().sexController.text,
                  date: DateFormat('yyyy-MM-dd').format(_selectedDate!),
                  doctorId: widget.doctorId!,
                  time: context.read<DoctorsCubit>().timeController.text,
                );
                print("Doctor ID: ${widget.doctorId}");
                print("Selected Date: $_selectedDate");
              },
            ),
          ],
        ),
      ),
    );
  }
}
