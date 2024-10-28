import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulseIndicator extends StatelessWidget {
  final int beforeMealValue;
  final int afterMealValue;

  const PulseIndicator({
    super.key,
    required this.beforeMealValue,
    required this.afterMealValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsManager.kPrimaryLightColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  verticalSpace(10),
                  SizedBox(
                    height: 10.h,
                    child: PieChart(
                      PieChartData(
                        sections: _createPieChartSections(),
                        borderData: FlBorderData(show: false),
                        centerSpaceRadius: 10.r,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      _indicator(Colors.blue, "قبل الوجبة"),
                      const Spacer(),
                      _indicator(Colors.red, "بعد الوجبة"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _createPieChartSections() {
    final total = beforeMealValue + afterMealValue;
    return [
      PieChartSectionData(
        value: beforeMealValue.toDouble(),
        color: Colors.blue,
        title: '${(beforeMealValue / total * 100).toStringAsFixed(1)}%',
        radius: 50.r,
      ),
      PieChartSectionData(
        value: afterMealValue.toDouble(),
        color: Colors.red,
        title: '${(afterMealValue / total * 100).toStringAsFixed(1)}%',
        radius: 50.r,
      ),
    ];
  }

  Widget _indicator(Color color, String text) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.w),
          height: 10.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(text),
      ],
    );
  }
}
