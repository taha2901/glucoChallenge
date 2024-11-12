import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart'; // تأكد من استيراد مكتبة الرسوم البيانية
import 'package:auto_size_text/auto_size_text.dart'; // تأكد من استيراد مكتبة النصوص القابلة للتغيير

class SugarTabWidget extends StatelessWidget {
  const SugarTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
      builder: (context, state) {
        if (state is GetBloodSugerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetBloodSugerSuccess) {
          if (state.bloodSugar.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildSuccessState(state);
        } else if (state is GetBloodSugerError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return  _buildEmptyState(context);
        }
      },
    );
  }

  Widget _buildSuccessState(GetBloodSugerSuccess state) {
    // الحصول على آخر قياس سكر
    double lastSugarReading = state.bloodSugar.isNotEmpty
        ? state.bloodSugar.last.sugarReading.toDouble() // Cast to double
        : 0.0;

    // تحديد الرسائل المناسبة بناءً على مستوى السكر
    String message;
    String imagePath;

    if (lastSugarReading > 180) {
      message = "لقد اهملت اليوم بمي يكفي اتمني الانتظام في وقتا لاحق";
      imagePath = 'assets/images/suger2.png'; // ضع مسار الصورة المناسبة هنا
    } else if (lastSugarReading < 70) {
      message = "بدا انتظامك يقل اليوم يجب ان تحافظ علي صحتك و علي مستوي سكرك";
      imagePath = 'assets/images/suger2.png'; // ضع مسار الصورة المناسبة هنا
    } else {
      message = "يوم رائع يوجد تحسن في مستوي السكر لديك وصل في اخذ الادويه و عمل بعض الانشطه";
      imagePath = 'assets/images/suger1.png'; // ضع مسار الصورة المناسبة هنا
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset(
              imagePath,
              height: 100, // يمكنك ضبط الحجم حسب احتياجاتك
              width: 100,
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
          height: 400,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: LineChart(
              _buildLineChartData(state.bloodSugar),
              key: ValueKey(state.bloodSugar),
            ),
          ).animate().slideY(duration: 400.ms), // إضافة تأثير الرسوم المتحركة
        ),
      ],
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
                .read<MeasurmentsCubit>()
                .fetchSugarData(DateHelper.getCurrentDate());
          },
        ),
      ],
    );
  }


  LineChartData _buildLineChartData(List<SugarMeasurement> sugarData) {
    List<FlSpot> beforeMealSpots = [];
    List<FlSpot> afterMealSpots = [];

    for (int i = 0; i < sugarData.length; i++) {
      if (sugarData[i].measurementDate == 'قبل الاكل') {
        beforeMealSpots
            .add(FlSpot(i.toDouble(), sugarData[i].sugarReading.toDouble()));
      } else if (sugarData[i].measurementDate == 'بعد الاكل') {
        afterMealSpots
            .add(FlSpot(i.toDouble(), sugarData[i].sugarReading.toDouble()));
      }
    }

    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black, width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: beforeMealSpots,
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
        ),
        LineChartBarData(
          spots: afterMealSpots,
          isCurved: true,
          color: Colors.red,
          barWidth: 4,
          belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
        ),
      ],
    );
  }
}
