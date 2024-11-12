import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/field_drop_down.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartScreenSuger extends StatefulWidget {
  final String? suffixText;
  final String hintText;

  const PartScreenSuger(this.suffixText, this.hintText, {super.key});

  @override
  State<PartScreenSuger> createState() => _PartScreenSugerState();
}

class _PartScreenSugerState extends State<PartScreenSuger> {
  String? selectedMeal;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController sugarLevelController = TextEditingController();

  void _onSaveButtonPressed() {
    if (formKey.currentState!.validate()) {
      int sugarLevel;
      try {
        sugarLevel = int.parse(sugarLevelController.text.trim());
      } catch (e) {
        debugPrint("Invalid sugar level input");
        return;
      }

      if (selectedMeal == null) {
        debugPrint("Selected meal cannot be null");
        return;
      }

      // إضافة القياس
      context.read<MeasurmentsCubit>().emitAddBloodSugar(
            selectedMeal!,
            sugarLevel,
          );
    }
  }

  void onMealChanged(String? mealName) {
    setState(() {
      selectedMeal = mealName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildSugarLevelInput(),
              verticalSpace(16),
              CustomTextFieldDropdown(mealname: onMealChanged),
              verticalSpace(24),
              _buildSaveButton(),
              verticalSpace(16),
              _buildMealIndicators(),
              verticalSpace(16),

              // الاستماع لحالة الإضافة لتحديث البيانات
              BlocListener<MeasurmentsCubit, MeasurmentsState>(
                listener: (context, state) {
                  if (state is AddBloodSugerSuccess) {
                    // تحديث البيانات بعد نجاح الإضافة
                    String formattedDate = DateHelper.getCurrentDate();
                    context
                        .read<MeasurmentsCubit>()
                        .fetchSugarData(formattedDate);
                  }
                },
                child: BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
                  builder: (context, state) {
                    if (state is GetBloodSugerLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is GetBloodSugerSuccess) {
                      if (state.bloodSugar.isEmpty) {
                        return _buildEmptyState(
                            context); // هذا الجزء سيظهر عندما لا توجد بيانات.
                      }
                      return Column(
                        children: [
                          const Text(
                              "مستوى السكر في الدم (الزمن مقابل القراءة)"),
                          SizedBox(
                            height: 300,
                            child: LineChart(
                              _buildLineChartData(state.bloodSugar),
                            ),
                          ),
                        ],
                      );
                    }
                    // else if(state is GetBloodSugerSuccess && state.bloodSugar.isEmpty){
                    //   return _buildEmptyState(context);
                    // }
                    else if (state is GetBloodSugerError) {
                      return Text('Error: ${state.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildSugarLevelInput() {
    return AppTextFormField(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      keyboardType: TextInputType.number,
      suffixText: widget.suffixText,
      hintText: widget.hintText,
      controller: sugarLevelController,
    );
  }

  Widget _buildSaveButton() {
    return AppTextButton(
      onPressed: _onSaveButtonPressed,
      buttonText: 'حفظ',
      borderRadius: 5,
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildMealIndicators() {
    return const Row(
      children: [
        Text("بعد الوجبه"),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 5,
          ),
        ),
        Spacer(),
        Text("قبل الوجبه"),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 5,
          ),
        ),
      ],
    );
  }

  // دالة لبناء البيانات للرسم البياني
  LineChartData _buildLineChartData(List<SugarMeasurement> sugarData) {
    List<FlSpot> beforeMealSpots = [];
    List<FlSpot> afterMealSpots = [];

    // فرز القراءات بناءً على نوع الوجبة
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
      titlesData: const FlTitlesData(show: true),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black, width: 1),
      ),
      lineBarsData: [
        // خط لقراءات قبل الوجبة
        LineChartBarData(
          spots: beforeMealSpots,
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          belowBarData:
              BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
        ),
        // خط لقراءات بعد الوجبة
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
}
