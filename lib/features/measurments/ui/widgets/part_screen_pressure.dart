import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/logic/measurments_cubit.dart';
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
                  context.read<MeasurmentsCubit>().diastolicController.text =
                      contractController.text; // قيمة الانقباض
                  context.read<MeasurmentsCubit>().systolicController.text =
                      extraversionController.text; // قيمة الانبساط
                  context.read<MeasurmentsCubit>().heartRateController.text =
                      heartController.text; // معدل ضربات القلب
                  context.read<MeasurmentsCubit>().emitAddBloodPressure();
                }
              },
              buttonText: 'حفظ',
              borderRadius: 5,
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            _buildIndicators(),
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
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: color,
            radius: 5,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    contractController.dispose();
    extraversionController.dispose();
    heartController.dispose();
    super.dispose();
  }
}
