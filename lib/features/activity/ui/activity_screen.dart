import 'package:auto_size_text/auto_size_text.dart';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الأنشطة',
            style: TextStyles.font18BlackBold,
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 4,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 4,
            tabs: const [
              Tab(text: 'سكر'),
              Tab(text: 'ضغط'),
              Tab(text: 'وزن'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSugarTab(context),
            _buildPressureTab(context),
            _buildWeightTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSugarTab(BuildContext context) {
    return BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
      builder: (context, state) {
        if (state is GetBloodSugerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetBloodSugerSuccess) {
          // الحصول على آخر قياس سكر
          double lastSugarReading = state.bloodSugar.isNotEmpty
              ? state.bloodSugar.last.sugarReading.toDouble() // Cast to double
              : 0.0;

          // تحديد الرسائل المناسبة بناءً على مستوى السكر
          String message;
          String imagePath;

          if (lastSugarReading > 180) {
            message = "لقد اهملت اليوم بمي يكفي اتمني الانتظام في وقتا لاحق";
            imagePath =
                'assets/images/suger2.png'; // ضع مسار الصورة المناسبة هنا
          } else if (lastSugarReading < 70) {
            message =
                "بدا انتظامك يقل اليوم يجب ان تحافظ علي صحتك و علي مستوي سكرك";
            imagePath =
                'assets/images/suger2.png'; // ضع مسار الصورة المناسبة هنا
          } else {
            message =
                "يوم رائع يوجد تحسن في مستوي السكر لديك وصل في اخذ الادويه و عمل بعض الانشطه";
            imagePath =
                'assets/images/suger1.png'; // ضع مسار الصورة المناسبة هنا
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
                    _buildLineChartData(state.bloodSugar),
                    key: ValueKey(state.bloodSugar),
                  ),
                ),
              )
                  .animate()
                  .slideY(duration: 400.ms), // إضافة تأثير الرسوم المتحركة
            ],
          );
        } else if (state is GetBloodSugerError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  // دالة لبناء البيانات للرسم البياني
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
          belowBarData:
              BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
        ),
        LineChartBarData(
          spots: afterMealSpots,
          isCurved: true,
          color: Colors.red,
          barWidth: 4,
          belowBarData:
              BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
        ),
      ],
    );
  }

  // دالة تبويب الضغط لعرض الرسم البياني

  Widget _buildPressureTab(BuildContext context) {
    return BlocBuilder<PressureCubit, PressureState>(
      builder: (context, state) {
        if (state is GetBloodPressureLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetBloodPressureSuccess) {
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
                    _buildLineChartPressureData(state.bloodPressure),
                    key: ValueKey(state.bloodPressure),
                  ),
                ),
              ).animate().slideY(duration: 400.ms),
            ],
          );
        } else if (state is GetBloodPressureError) {
          return Center(child: Text('Error: ${state.toString()}'));
        } else {
          return const Center(child: Text('No data available'));
        }
      },
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
              _createSpots(data, (measurement) => measurement.systolicPressure),
          isCurved: true,
          color: Colors.red,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: _createSpots(
              data, (measurement) => measurement.diastolicPressure),
          isCurved: true,
          color: Colors.yellow,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: _createSpots(data, (measurement) => measurement.heartRate),
          isCurved: true,
          color: Colors.blue,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  // Helper function to create spots for each line
  List<FlSpot> _createSpots(
    List<BloodPressureMeasurement> data,
    int Function(BloodPressureMeasurement measurement) valueGetter,
  ) {
    return data.asMap().entries.map((entry) {
      int index = entry.key;
      BloodPressureMeasurement measurement = entry.value;
      return FlSpot(index.toDouble(), valueGetter(measurement).toDouble());
    }).toList();
  }

  // دالة لبناء الرسم البياني الخاص بالوزن
  Widget _buildWeightTab(BuildContext context) {
  return BlocBuilder<WeightCubit, WeightState>(
    builder: (context, state) {
      if (state is GetWeightLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetWeightSuccess) {
        // الحصول على آخر قياس وزن
        double lastWeightReading = state.weightMeasurements.isNotEmpty
            ? state.weightMeasurements.last.weight.toDouble() // Cast to double
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
                  _buildWeightLineChart(state.weightMeasurements),
                  key: ValueKey(state.weightMeasurements),
                ),
              ),
            ).animate().slideY(duration: 400.ms),
          ],
        );
      } else if (state is GetWeightError) {
        return Center(child: Text('Error: ${state.error}'));
      } else {
        return const Center(child: Text('No data available'));
      }
    },
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
