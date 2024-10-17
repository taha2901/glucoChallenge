import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTimeLinedoctor extends StatelessWidget {
  final Function(DateTime) onDateChange;

  const MyTimeLinedoctor({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(32),
          _changeDayStructureExample(),
          verticalSpace(32),
        ],
      ),
    );
  }

  EasyDateTimeLine _changeDayStructureExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        // Pass the selected date to the callback function
        onDateChange(selectedDate);
      },
      activeColor: ColorsManager.mainColor,
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.monthOnly(),
      ),
      dayProps:  EasyDayProps(
        height: 100.h,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: const DayStyle(
          // borderRadius: 48.0,
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
        activeDayStyle: const DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
