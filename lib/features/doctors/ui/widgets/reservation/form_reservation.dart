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
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'يرجى ادخال اسمك';
              }
              return null;
            },
            prefixIcon: const Icon(Icons.person),
            suffixIcon: InkWell(
              onTap: () => ageController.clear(),
              child: const Icon(Icons.close),
            ),
            borderRadius: BorderRadius.circular(10),
            hintText: 'أدخل اسمك',
            controller: nameController,
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: InkWell(
                    onTap: () => ageController.clear(),
                    child: const Icon(Icons.close),
                  ),
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'يرجى ادخال الجنس';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(10),
                  hintText: 'الجنس',
                  controller: sexController,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: AppTextFormField(
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'يرجى ادخال العمر';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.calendar_month),
                  suffixIcon: InkWell(
                    onTap: () => ageController.clear(),
                    child: const Icon(Icons.close),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  hintText: 'أدخل عمرك',
                  controller: ageController,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AppTextFormField(
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone),
            suffixIcon: InkWell(
              onTap: () => ageController.clear(),
              child: const Icon(Icons.close),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى ادخال رقم الهاتف';
              }
              return null;
            },
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
                      doctorResponseBody: doctorResponseBody,
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
