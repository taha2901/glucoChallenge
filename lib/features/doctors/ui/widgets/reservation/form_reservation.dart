import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FormReservation extends StatelessWidget {
  final int doctorId;
  const FormReservation({
    super.key,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
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
        context.read<DoctorsCubit>().dateController.text =
            DateFormat('yyyy-MM-dd').format(picked);
        print(
            "Selected Date: ${context.read<DoctorsCubit>().dateController.text}"); // Print the selected date
      }
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        context.read<DoctorsCubit>().timeController.text =
            picked.format(context);
        print(
            "Selected Time: ${context.read<DoctorsCubit>().timeController.text}"); // Print the selected time
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
                  controller: context.read<DoctorsCubit>().ageController,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AppTextFormField(
            borderRadius: BorderRadius.circular(10),
            hintText: 'أدخل رقم تلفونك',
            controller: context.read<DoctorsCubit>().phoneController,
          ),
          verticalSpace(16),
          GestureDetector(
            onTap: () => _selectTime(context),
            child: AbsorbPointer(
              child: AppTextFormField(
                borderRadius: BorderRadius.circular(10),
                hintText: 'أدخل الوقت',
                controller: context.read<DoctorsCubit>().timeController,
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
                // DoctorsCubit.get(context).emitReservationStates(doctorId);
                debugPrint("Doctor IDdd: ${doctorId.toString()}");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmDoctorReservation(
                        doctorId: doctorId,
                        username:
                            nameController.text,
                        sex: sexController.text,
                        age : int.tryParse(context.read<DoctorsCubit>().ageController.text),
                        phone:
                            context.read<DoctorsCubit>().phoneController.text,
                        time: context.read<DoctorsCubit>().timeController.text,
                      ),
                    ));
                    print('name Controller: ${nameController.text}');
                    print('sex Controller: ${sexController.text}');
                    print('age Controller: ${context.read<DoctorsCubit>().ageController.text}');
                    print('phone Controller: ${context.read<DoctorsCubit>().phoneController.text}');
                    print(
                        "Selected Time: ${context.read<DoctorsCubit>().timeController.text}");
                        print(
                            "Selected Date: ${context.read<DoctorsCubit>().dateController.text}");
                            print('Doctor ID: ${doctorId.toString()}');
              }
              print(
                  "Time Selected: ${context.read<DoctorsCubit>().timeController.text}");
            },
          ),
        ],
      ),
    );
  }
}
