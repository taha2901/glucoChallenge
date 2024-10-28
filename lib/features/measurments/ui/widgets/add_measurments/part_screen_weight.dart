import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/data/model/get_measurments_models/get_weight_response.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_state.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/drop_down_activity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartScreenWeight extends StatelessWidget {
  final String? unitText;
  final String hintText;

  PartScreenWeight({this.unitText, required this.hintText, super.key});

  final TextEditingController weightController = TextEditingController();

  String? selectedActivity;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildWeightForm(),
          const SizedBox(height: 24),
          _buildSaveButton(context),
          const SizedBox(height: 24),
          _buildWeightChart(),
        ],
      ),
    );
  }

  Widget _buildWeightForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            _buildWeightInputField(),
            const SizedBox(height: 16),
            DropdownActivity(onChanged: _onActivityChanged),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightInputField() {
    return AppTextFormField(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      controller: weightController,
      suffixText: unitText,
      hintText: hintText,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال الوزن';
        }
        return null;
      },
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'حفظ',
      borderRadius: 5,
      backgroundColor: ColorsManager.mainColor,
      textStyle: const TextStyle(color: Colors.white),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (selectedActivity == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('يرجى ملء جميع الحقول.')),
            );
            return;
          }

          int weight = int.parse(weightController.text.trim());
          context.read<WeightCubit>().emitAddWeight(weight, selectedActivity);
        }
      },
    );
  }

  Widget _buildWeightChart() {


    return BlocConsumer<WeightCubit, WeightState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          addWeightSuccess: () {
            context
                .read<WeightCubit>()
                .fetchWeightData(DateHelper.getCurrentDate());
          },
        );
      },
      builder: (context, state) {
        return BlocBuilder<WeightCubit, WeightState>(
          builder: (context, state) {
            if (state is GetWeightLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetWeightSuccess) {
              return _buildWeightLineChart(state.weightMeasurements);
            } else if (state is GetWeightError) {
              return Text('Error: ${state.error}');
            } else {
              return const Text('No data available');
            }
          },
        );
      },
    );
  }

  Widget _buildWeightLineChart(List<WeightMeasurement> weightData) {
    List<FlSpot> weightSpots = weightData
        .asMap()
        .entries
        .map((entry) =>
            FlSpot(entry.key.toDouble(), entry.value.weight.toDouble()))
        .toList();

    return Column(
      children: [
        const Text("مستوى الوزن (الزمن مقابل القراءة)"),
        SizedBox(
          height: 300,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: const FlTitlesData(show: true),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: weightSpots,
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,
                  belowBarData: BarAreaData(
                      show: true, color: Colors.blue.withOpacity(0.3)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onActivityChanged(String? value) {
    selectedActivity = value;
  }
}
