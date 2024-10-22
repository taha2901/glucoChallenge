import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:challenge/features/medicine/logic/medicine_state.dart';
import 'package:challenge/features/medicine/ui/widgets/medicine_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMedicineScreen extends StatelessWidget {
  const AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicineCubit, MedicineState>(
      listener: (context, state) {
        state.maybeWhen(
          addMedicineLoading: () {
            const Center(
              child: CircularProgressIndicator(),
            );
          },
          addMedicineSuccess: () {
            showToast(msg: 'Successfully added', state: ToastStates.SUCCESS);
            context.read<MedicineCubit>().getMedicine();
            Navigator.pop(context);
          },
          addMedicineError: () {
            showToast(msg: 'Failed to add', state: ToastStates.ERROR);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MedicineAppBar(
                  onPressed: () => Navigator.pop(context),
                ),
                verticalSpace(16),
                const Expanded(
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: AddMedicineForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddMedicineForm extends StatelessWidget {
  const AddMedicineForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = context.read<MedicineCubit>().formKey;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'اسم الدواء',
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            prefixIcon: const Icon(Icons.medication),
            controller: context.read<MedicineCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'الجرعة',
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            controller: context.read<MedicineCubit>().dosageController,
          ),
          verticalSpace(16),
          // استبدال DropdownButtonFormField بزر لفتح Bottom Sheet
          InkWell(
            onTap: () async {
              // استدعاء Bottom Sheet لاختيار الوقت
              await _selectTime(context);
            },
            child: IgnorePointer(
              child: AppTextFormField(
                hintText: 'الوقت',
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                controller: context.read<MedicineCubit>().timeController,
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'عدد الجرعات',
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            controller: context.read<MedicineCubit>().countController,
          ),
          verticalSpace(16),
          AppTextButton(
            borderRadius: 10,
            buttonText: 'حفظ',
            textStyle: TextStyles.font18WhiteBold,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<MedicineCubit>().emitAddMedicine();
              }
            },
          ),
        ],
      ),
    );
  }

  // الدالة التي تفتح Bottom Sheet لاختيار الوقت
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // الوقت الافتراضي: الوقت الحالي
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context); // تنسيق الوقت
      context.read<MedicineCubit>().timeController.text = formattedTime;
    }
  }
}
