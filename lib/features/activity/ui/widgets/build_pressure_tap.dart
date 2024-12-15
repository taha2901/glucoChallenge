import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart'; // تأكد من استيراد الحزمة الخاصة بالرسم البياني
import 'package:auto_size_text/auto_size_text.dart'; // تأكد من استيراد الحزمة الخاصة بـ AutoSizeText

class PressureTab extends StatelessWidget {
  const PressureTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PressureCubit, PressureState>(
      builder: (context, state) {
        if (state is GetBloodPressureLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetBloodPressureSuccess) {
          if (state.bloodPressure.isEmpty) {
            return _buildEmptyState(context);
          }
          double lastSystolic = state.bloodPressure.isNotEmpty
              ? state.bloodPressure.last.systolicPressure.toDouble()
              : 0.0;
          double lastDiastolic = state.bloodPressure.isNotEmpty
              ? state.bloodPressure.last.diastolicPressure.toDouble()
              : 0.0;

          String message;
          String imagePath;

          // تحديد الرسائل والصور بناءً على مستوى الضغط
          if (lastSystolic > 140 || lastDiastolic > 90) {
            message = "ضغط دمك مرتفع، يجب عليك اتخاذ الإجراءات اللازمة.";
            imagePath = 'assets/images/suger2.png'; // المسار المناسب للصورة
          } else if (lastSystolic < 90 || lastDiastolic < 60) {
            message = "ضغط دمك منخفض، تأكد من تناول السوائل.";
            imagePath = 'assets/images/suger3.png'; // المسار المناسب للصورة
          } else {
            message = "ضغط دمك في المستوى الطبيعي، استمر في العناية بصحتك.";
            imagePath = 'assets/images/suger1.png'; // المسار المناسب للصورة
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Image.asset(
                    imagePath,
                    height: 100,
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 400,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: LineChart(
                    _buildLineChartPressureData(state.bloodPressure),
                    key: ValueKey(state.bloodPressure),
                  ),
                ),
              ),
            ],
          );
        } else if (state is GetBloodPressureError) {
          return Center(child: Text('Error: ${state.toString()}'));
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
                .read<PressureCubit>()
                .fetchPressureData(DateHelper.getCurrentDate());
          },
        ),
      ],
    );
  }

  // دالة لبناء البيانات للرسم البياني الخاص بالضغط
  LineChartData _buildLineChartPressureData(
      List<BloodPressureMeasurement> data) {
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots:
              _createSpots(data, (measurement) => measurement.systolicPressure.toDouble()),
          isCurved: true,
          color: Colors.red,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: _createSpots(
              data, (measurement) => measurement.diastolicPressure.toDouble()),
          isCurved: true,
          color: Colors.yellow,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: _createSpots(data, (measurement) => measurement.heartRate.toDouble()),
          isCurved: true,
          color: Colors.blue,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  List<FlSpot> _createSpots(
      List<BloodPressureMeasurement> data,
      double Function(BloodPressureMeasurement measurement) selector) {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), selector(data[i]).toDouble()));
    }
    return spots;
  }
}
