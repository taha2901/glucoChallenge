import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormReservation extends StatelessWidget {
  final int doctorId;

  const FormReservation({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    // تعريف المتغيرات في نطاق الكلاس بدلاً من داخل الدالة
    TextEditingController dateController = TextEditingController();
    // TextEditingController timeController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController sexController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
        print("Selected Date: ${dateController.text}");
      }
    }

    // Future<void> _selectTime(BuildContext context) async {
    //   final TimeOfDay? picked = await showTimePicker(
    //     context: context,
    //     initialTime: TimeOfDay.now(),
    //   );
    //   if (picked != null) {
    //     timeController.text = picked.format(context);
    //     print("Selected Time: ${timeController.text}");
    //   }
    // }

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
          // verticalSpace(16),
          // GestureDetector(
          //   onTap: () => _selectTime(context),
          //   child: AbsorbPointer(
          //     child: AppTextFormField(
          //       borderRadius: BorderRadius.circular(10),
          //       hintText: 'أدخل الوقت',
          //       controller: timeController,
          //       suffixIcon: const Icon(Icons.access_time),
          //     ),
          //   ),
          // ),
          verticalSpace(32),
          AppTextButton(
            borderRadius: 10,
            textStyle: const TextStyle(color: Colors.white),
            buttonText: 'التالي',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmDoctorReservation(
                      doctorId: doctorId,
                      username: nameController.text,
                      sex: sexController.text,
                      age: int.tryParse(ageController.text),
                      phone: phoneController.text,
                      // time: timeController.text,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
