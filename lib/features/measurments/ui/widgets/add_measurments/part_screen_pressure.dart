// import 'package:challenge/core/helpers/constants.dart';
// import 'package:challenge/core/helpers/spacing.dart';
// import 'package:challenge/core/widget/app_text_button.dart';
// import 'package:challenge/core/widget/app_text_form_field.dart';
// import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
// import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
// import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PartScreenPressure extends StatefulWidget {
//   final String? label1;
//   final String? label2;
//   final String? label3;
//   final String? hint1;
//   final String? hint2;
//   final String? hint3;

//   const PartScreenPressure(
//     this.label1,
//     this.label2,
//     this.label3,
//     this.hint1,
//     this.hint2,
//     this.hint3, {
//     super.key,
//   });

//   @override
//   State<PartScreenPressure> createState() => _PartScreenPressureState();
// }

// class _PartScreenPressureState extends State<PartScreenPressure> {
//   final TextEditingController contractController = TextEditingController();

//   final TextEditingController extraversionController = TextEditingController();

//   final TextEditingController heartController = TextEditingController();

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 28),
//         child: Column(
//           children: [
//             Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   _buildTextField(
//                       hint: widget.hint1,
//                       label: widget.label1,
//                       controller: contractController),
//                   _buildTextField(
//                       hint: widget.hint2,
//                       label: widget.label2,
//                       controller: extraversionController),
//                   _buildTextField(
//                       hint: widget.hint3,
//                       label: widget.label3,
//                       controller: heartController),
//                 ],
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.width * 0.03),
//             AppTextButton(
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   context.read<PressureCubit>().diastolicController.text =
//                       contractController.text; // قيمة الانقباض
//                   context.read<PressureCubit>().systolicController.text =
//                       extraversionController.text; // قيمة الانبساط
//                   context.read<PressureCubit>().heartRateController.text =
//                       heartController.text; // معدل ضربات القلب
//                   context.read<PressureCubit>().emitAddBloodPressure();
//                 }
//               },
//               buttonText: 'حفظ',
//               borderRadius: 5,
//               backgroundColor: Colors.blue,
//               textStyle: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 16),
//             _buildIndicators(),
//             BlocListener<PressureCubit, PressureState>(
//                 listener: (context, state) {
//                   if (state is  AddBloodPressureSuccess) {
//                     // تحديث البيانات بعد نجاح الإضافة
//                     String formattedDate = DateHelper.getCurrentDate();
//                     context.read<PressureCubit>().fetchPressureData(formattedDate);
//                   }
//                 },
//                   child: BlocBuilder<PressureCubit, PressureState>(
//                     builder: (context, state) {
//                       if (state is GetBloodPressureLoading) {
//                         return const CircularProgressIndicator();
//                       } else if (state is GetBloodPressureSuccess) {
//                         return Column(
//                           children: [
//                             const Text("مستوى السكر في الدم (الزمن مقابل القراءة)"),
//                             SizedBox(
//                               height: 300,
//                               child: LineChart(
//                                 _buildLineChartData(state.bloodPressure),
//                               ),
//                             ),
//                           ],
//                         );
//                       } else if (state is GetBloodPressureError) {
//                         return const Text('Error');
//                       } else {
//                         return const CircularProgressIndicator();
//                       }
//                     },
//                   ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String? hint,
//     required String? label,
//     required TextEditingController controller,
//   }) {
//     return Column(
//       children: [
//         AppTextFormField(
//           borderRadius: BorderRadius.all(Radius.circular(5.r)),
//           keyboardType: TextInputType.number,
//           suffixText: label ?? '',
//           hintText: hint ?? '',
//           controller: controller,
//         ),
//         verticalSpace(16),
//       ],
//     );
//   }

//   Widget _buildIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildIndicator(label: "الانقباض", color: Colors.yellow),
//         _buildIndicator(label: "الانبساط", color: Colors.red),
//         _buildIndicator(label: "ضربات القلب", color: Colors.blue),
//       ],
//     );
//   }

//   Widget _buildIndicator({required String label, required Color color}) {
//     return Row(
//       children: [
//         Text(label),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundColor: color,
//             radius: 5,
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData _buildLineChartData(List<BloodPressureMeasurement> data) {
//     return LineChartData(
//       gridData: const FlGridData(show: false),
//       titlesData: const FlTitlesData(show: true),
//       borderData: FlBorderData(show: true),
//       lineBarsData: [
//         // Line for systolic pressure (الانبساط)
//         LineChartBarData(
//           spots:
//               _createSpots(data, (measurement) => measurement.systolicPressure),
//           isCurved: true,
//           color: Colors.red, // Red color for systolic pressure
//           dotData: const FlDotData(show: false),
//           belowBarData: BarAreaData(show: false),
//         ),
//         // Line for diastolic pressure (الانقباض)
//         LineChartBarData(
//           spots: _createSpots(
//               data, (measurement) => measurement.diastolicPressure),
//           isCurved: true,
//           color: Colors.yellow, // Yellow color for diastolic pressure
//           dotData: const FlDotData(show: false),
//           belowBarData: BarAreaData(show: false),
//         ),
//         // Line for heart rate (ضربات القلب)
//         LineChartBarData(
//           spots: _createSpots(data, (measurement) => measurement.heartRate),
//           isCurved: true,
//           color: Colors.blue, // Blue color for heart rate
//           dotData: const FlDotData(show: false),
//           belowBarData: BarAreaData(show: false),
//         ),
//       ],
//     );
//   }

// // Helper function to create spots for each line
//   List<FlSpot> _createSpots(
//     List<BloodPressureMeasurement> data,
//     int Function(BloodPressureMeasurement measurement) valueGetter,
//   ) {
//     return data.asMap().entries.map((entry) {
//       int index = entry.key;
//       BloodPressureMeasurement measurement = entry.value;
//       return FlSpot(index.toDouble(), valueGetter(measurement).toDouble());
//     }).toList();
//   }

//   @override
//   void dispose() {
//     contractController.dispose();
//     extraversionController.dispose();
//     heartController.dispose();
//     super.dispose();
//   }
// }






import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartScreenPressure extends StatefulWidget {
  final String? label1;
  final String? label2;
  final String? label3;
  final String? hint1;
  final String? hint2;
  final String? hint3;

  const PartScreenPressure(
    this.label1,
    this.label2,
    this.label3,
    this.hint1,
    this.hint2,
    this.hint3, {
    super.key,
  });

  @override
  State<PartScreenPressure> createState() => _PartScreenPressureState();
}

class _PartScreenPressureState extends State<PartScreenPressure> {
  final TextEditingController contractController = TextEditingController();
  final TextEditingController extraversionController = TextEditingController();
  final TextEditingController heartController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  _buildTextField(
                      hint: widget.hint1,
                      label: widget.label1,
                      controller: contractController),
                  _buildTextField(
                      hint: widget.hint2,
                      label: widget.label2,
                      controller: extraversionController),
                  _buildTextField(
                      hint: widget.hint3,
                      label: widget.label3,
                      controller: heartController),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            AppTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<PressureCubit>().diastolicController.text =
                      contractController.text; // قيمة الانقباض
                  context.read<PressureCubit>().systolicController.text =
                      extraversionController.text; // قيمة الانبساط
                  context.read<PressureCubit>().heartRateController.text =
                      heartController.text; // معدل ضربات القلب
                  context.read<PressureCubit>().emitAddBloodPressure();
                }
              },
              buttonText: 'حفظ',
              borderRadius: 5,
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            _buildIndicators(),
            BlocListener<PressureCubit, PressureState>(
              listener: (context, state) {
                if (state is AddBloodPressureSuccess) {
                  // تحديث البيانات بعد نجاح الإضافة
                  String formattedDate = DateHelper.getCurrentDate();
                  context.read<PressureCubit>().fetchPressureData(formattedDate);
                }
              },
              child: BlocBuilder<PressureCubit, PressureState>(
                builder: (context, state) {
                  if (state is GetBloodPressureLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        minHeight: 8.h,
                      ),
                    );
                  } else if (state is GetBloodPressureSuccess) {
                    if (state.bloodPressure.isEmpty) {
                      return _buildNoDataView();
                    }
                    return Column(
                      children: [
                        const Text("مستوى السكر في الدم (الزمن مقابل القراءة)"),
                        SizedBox(
                          height: 300,
                          child: LineChart(
                            _buildLineChartData(state.bloodPressure),
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetBloodPressureError) {
                    return _buildErrorView(state.toString());
                  } else {
                    return _buildNoDataView();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String? hint,
    required String? label,
    required TextEditingController controller,
  }) {
    return Column(
      children: [
        AppTextFormField(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          keyboardType: TextInputType.number,
          suffixText: label ?? '',
          hintText: hint ?? '',
          controller: controller,
        ),
        verticalSpace(16),
      ],
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIndicator(label: "الانقباض", color: Colors.yellow),
        _buildIndicator(label: "الانبساط", color: Colors.red),
        _buildIndicator(label: "ضربات القلب", color: Colors.blue),
      ],
    );
  }

  Widget _buildIndicator({required String label, required Color color}) {
    return Row(
      children: [
        Text(label),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: color,
            radius: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildNoDataView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(Icons.warning_amber_outlined, size: 60, color: Colors.orange),
          const SizedBox(height: 10),
          Text(
            "لا توجد بيانات لعرضها",
            style: TextStyle(
                fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            "حاول إضافة قياسات جديدة.",
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(String error) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 10),
          Text(
            "حدث خطأ: $error",
            style: TextStyle(
                fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          const SizedBox(height: 10),
          Text(
            "يرجى المحاولة لاحقًا.",
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData(List<BloodPressureMeasurement> data) {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: true),
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

  @override
  void dispose() {
    contractController.dispose();
    extraversionController.dispose();
    heartController.dispose();
    super.dispose();
  }
}
