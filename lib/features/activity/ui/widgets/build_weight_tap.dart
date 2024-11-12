import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightTab extends StatelessWidget {
  const WeightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        if (state is GetWeightLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetWeightSuccess) {
          if (state.weightMeasurements.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildWeightContent(state.weightMeasurements);
        } else if (state is GetWeightError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return _buildEmptyState(context);
        }
      },
    );
  }




  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.warning, size: 50, color: Colors.grey),
        const SizedBox(height: 12),
        Text(
          "لا توجد بيانات حالياً لعرضها",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 24),
        AppTextButton(
          buttonText: 'حاول لاحقاً',
          borderRadius: 5,
          backgroundColor: ColorsManager.mainColor,
          textStyle: const TextStyle(color: Colors.white),
          onPressed: () {
            // إعادة المحاولة أو إعادة تحميل البيانات
            context
                .read<WeightCubit>()
                .fetchWeightData(DateHelper.getCurrentDate());
          },
        ),
      ],
    );
  }


  Widget _buildWeightContent(List<WeightMeasurement> weightMeasurements) {
    // الحصول على آخر قياس وزن
    double lastWeightReading = weightMeasurements.isNotEmpty
        ? weightMeasurements.last.weight.toDouble() // Cast to double
        : 0.0;

    // تحديد الرسائل المناسبة بناءً على مستوى الوزن
    String message;
    String imagePath;

    if (lastWeightReading > 100) { // عتبة الوزن المرتفع
      message = "يبدو أنك بحاجة إلى مراقبة وزنك بشكل أفضل.";
      imagePath = 'assets/images/suger3.png'; // ضع مسار الصورة المناسبة هنا
    } else if (lastWeightReading < 50) { // عتبة الوزن المنخفض
      message = "وزنك منخفض، تأكد من تناول طعام صحي.";
      imagePath = 'assets/images/suger2.png'; // ضع مسار الصورة المناسبة هنا
    } else {
      message = "وزنك في المستوى المثالي، استمر في الحفاظ على عاداتك الصحية.";
      imagePath = 'assets/images/suger1.png'; // ضع مسار الصورة المناسبة هنا
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset(
              imagePath,
              height: 100.h,
              width: 100.w,
            ),
            Expanded(
              child: AutoSizeText(
                maxLines: 2,
                message,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 400.ms),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400.h,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: LineChart(
              _buildWeightLineChart(weightMeasurements),
              key: ValueKey(weightMeasurements),
            ),
          ),
        ).animate().slideY(duration: 400.ms),
      ],
    );
  }

  // دالة لبناء البيانات للرسم البياني الخاص بالوزن مع الرسوم المتحركة
  LineChartData _buildWeightLineChart(List<WeightMeasurement> weightData) {
    List<FlSpot> weightSpots = weightData
        .asMap()
        .entries
        .map((entry) =>
            FlSpot(entry.key.toDouble(), entry.value.weight.toDouble()))
        .toList();

    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: weightSpots,
          isCurved: true,
          color: Colors.green,
          barWidth: 4,
          belowBarData:
              BarAreaData(show: true, color: Colors.green.withOpacity(0.3)),
        ),
      ],
    );
  }
}
