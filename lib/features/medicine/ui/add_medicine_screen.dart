import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:challenge/features/medicine/ui/widgets/medicine_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            showToast(msg: 'Succesfully', state: ToastStates.SUCCESS);
            context.read<MedicineCubit>().getMedicine();
            Navigator.pop(context);
          },
          addMedicineError: () {
            showToast(msg: 'Failed', state: ToastStates.ERROR);
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
                ))
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
    var formkey = context.read<MedicineCubit>().formKey;

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'اسم الدواء',
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            prefixIcon: const Icon(Icons.medication),
            controller: context.read<MedicineCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'الجرعه',
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            controller: context.read<MedicineCubit>().dosageController,
          ),
          verticalSpace(16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'الوقت',
              border: OutlineInputBorder(),
            ),
            value: 'صباحًا',
            items: ['صباحًا', 'مساءً', 'بعد الظهر'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              context.read<MedicineCubit>().timeController.text = newValue!;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'العدد',
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            controller: context.read<MedicineCubit>().countController,
          ),
          verticalSpace(16),
          AppTextButton(
            borderRadius: 10,
            buttonText: 'حفظ',
            textStyle: TextStyles.font18WhiteBold,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                context.read<MedicineCubit>().emitAddMedicine();
              }
            },
          ),
        ],
      ),
    );
  }
}
