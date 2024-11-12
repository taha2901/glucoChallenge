import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class PulseIndicator extends StatelessWidget {
  final int beforeMealValue;
  final int afterMealValue;
  final String? noDataMessage;
  final bool isLoading; // متغير لتحديد حالة التحميل

  const PulseIndicator({
    super.key,
    required this.beforeMealValue,
    required this.afterMealValue,
    this.noDataMessage,
    this.isLoading = false, // افتراضي هو false
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
                  // إذا كانت هناك رسالة لعرضها، نعرضها هنا مع الأنيميشن
                  if (isLoading) 
                    _buildLoadingWidget()
                  else if (noDataMessage != null)
                    Expanded(
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0)
                                  .animate(animation),
                              child: child,
                            );
                          },
                          child: Container(
                            key: ValueKey<String>(noDataMessage!), // تغيير المفتاح لتحديث الرسالة عند الحاجة
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              noDataMessage!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      _indicator(Colors.blue, "قبل الوجبة"),
                      const Spacer(),
                      _indicator(Colors.red, "بعد الوجبة"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

Widget _buildLoadingWidget() {
  return RotationTransition(
    turns: AlwaysStoppedAnimation(1 / 2), // تدوير الشكل نصف دورة
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 100.r, // نفس حجم الدائرة الموجودة في PulseIndicator
        width: 100.r,  // نفس الحجم
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle, // يجعل الشكل دائري
        ),
      ),
    ),
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