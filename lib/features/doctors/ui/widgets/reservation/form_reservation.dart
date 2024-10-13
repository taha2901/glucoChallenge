import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class FormReservation extends StatelessWidget {
  const FormReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController sexController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
        print("Selected Date: ${dateController.text}"); // Print the selected date
      }
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        timeController.text = picked.format(context);
        print("Selected Time: ${timeController.text}"); // Print the selected time
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            borderRadius: BorderRadius.circular(10),
            hintText: 'أدخل اسمك',
            controller: nameController,
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  borderRadius: BorderRadius.circular(10),
                  hintText: 'الجنس',
                  controller: sexController,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: AppTextFormField(
                  borderRadius: BorderRadius.circular(10),
                  hintText: 'أدخل عمرك',
                  controller: ageController,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AppTextFormField(
            borderRadius: BorderRadius.circular(10),
            hintText: 'أدخل رقم تلفونك',
            controller: phoneController,
          ),         
          verticalSpace(16),
          GestureDetector(
            onTap: () => _selectTime(context),
            child: AbsorbPointer(
              child: AppTextFormField(
                borderRadius: BorderRadius.circular(10),
                hintText: 'أدخل الوقت',
                controller: timeController,
                suffixIcon: const Icon(Icons.access_time),
              ),
            ),
          ),
          verticalSpace(32),
          AppTextButton(
            borderRadius: 10,
            textStyle: const TextStyle(color: Colors.white),
            buttonText: 'التالي',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.pushNamed(Routers.confirmDoctorResrvation);
              }
              print("Time Selected: ${timeController.text}");
            },
          ),
        ],
      ),
    );
  }
}
