import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/measurments/logic/measurments_cubit.dart';
import 'package:challenge/features/measurments/ui/widgets/field_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartScreenSuger extends StatefulWidget {
  final String? suffixText;
  final String hintText;

  PartScreenSuger(this.suffixText, this.hintText, {super.key});

  @override
  State<PartScreenSuger> createState() => _PartScreenSugerState();
}

class _PartScreenSugerState extends State<PartScreenSuger> {
  //   void _onActivityChanged(String? value) {
  //   widget.selectedActivity = value;
  // }
  String? selectedMeal;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController sugarLevelController = TextEditingController();

  void onMealChanged(String? mealName) {
    selectedMeal = mealName;
  }

  String _getCurrentDate() {
    DateTime currentDate = DateTime.now();
    return "${currentDate.year}-${currentDate.month}-${currentDate.day}";
  }

  void _onSaveButtonPressed() {
    if (formKey.currentState!.validate()) {
      // Ensure the input is parsed correctly
      int sugarLevel;
      try {
        sugarLevel = int.parse(sugarLevelController.text.trim());
      } catch (e) {
        // Handle the parsing error
        debugPrint("Invalid sugar level input");
        return; // Exit if parsing fails
      }

      // Check if selectedActivity is null or not
      if (selectedMeal == null) {
        debugPrint("Selected activity cannot be null");
        return; // Exit if no activity is selected
      }

      String formattedDate = _getCurrentDate();
      debugPrint(formattedDate);
      context.read<MeasurmentsCubit>().sugarReadingController.text =
          sugarLevelController.text;
      context.read<MeasurmentsCubit>().emitAddBloodSugar(
            selectedMeal!,
            sugarLevel,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildSugarLevelInput(),
              const SizedBox(height: 16),
              CustomTextFieldDropdown(mealname: onMealChanged),
              const SizedBox(height: 24),
              _buildSaveButton(),
              const SizedBox(height: 16),
              _buildMealIndicators(),
              // const SizedBox(width: double.infinity, height: 300, child: Chartempty()),
            ],
          ),
        ),
      ),
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
}
