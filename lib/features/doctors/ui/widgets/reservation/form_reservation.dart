import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:flutter/material.dart';

class FormReservation extends StatelessWidget {
  final int doctorId;
  final DoctorResponseBody? doctorResponseBody;

  const FormReservation(
      {super.key, required this.doctorId, this.doctorResponseBody});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController sexController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      doctorResponseBody:  doctorResponseBody,
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
