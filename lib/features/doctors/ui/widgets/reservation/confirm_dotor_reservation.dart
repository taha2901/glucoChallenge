import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doc_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_reservation_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/time_line_cal_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDoctorReservation extends StatefulWidget {
  const ConfirmDoctorReservation({super.key});

  @override
  State<ConfirmDoctorReservation> createState() => _ConfirmDoctorReservationState();
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
