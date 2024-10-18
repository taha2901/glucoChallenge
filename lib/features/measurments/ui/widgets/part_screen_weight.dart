import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/logic/measurments_cubit.dart';
import 'package:challenge/features/measurments/ui/widgets/drop_down_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartScreenWeight extends StatelessWidget {
  final String? text2;
  final String text3;

  // تم نقل هذه المتغيرات إلى الكائن الذي يتم تمريره إلى الCubit
  final TextEditingController weightController = TextEditingController();
  String? selectedActivity;

  PartScreenWeight(this.text2, this.text3, {super.key});

  void _onActivityChanged(String? value) {
    selectedActivity = value;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  _buildWeightInput(),
                  const SizedBox(height: 16),
                  DropdownActivity(onChanged: _onActivityChanged),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSaveButton(context),
        ],
      ),
    );
  }

  Widget _buildWeightInput() {
    return AppTextFormField(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      controller: weightController,
      suffixText: text2,
      hintText: text3,
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

          context
              .read<MeasurmentsCubit>()
              .emitAddWeight(weight, selectedActivity);
        }
      },
    );
  }
}
