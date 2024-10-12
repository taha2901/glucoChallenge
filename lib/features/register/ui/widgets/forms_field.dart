import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FormsField extends StatelessWidget {
  const FormsField({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.passWordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController passWordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'من فضلك ادخل اسمك';
            }
            return null;
          },
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          prefixIcon: const Icon(Icons.person),
          hintText: 'أدخل اسمك',
          controller: nameController,
          onFieldSubmitted: (value) {
            nameController.text = value;
          },
        ),
        verticalSpace(15),
        AppTextFormField(
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'من فضلك ادخل البريد الالكتروني';
            }
            return null;
          },
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          prefixIcon: const Icon(Iconsax.direct),
          hintText: 'أدخل الايميل',
          controller: emailController,
          onFieldSubmitted: (value) {
            emailController.text = value;
          },
        ),
        verticalSpace(15),
        AppTextFormField(
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'من فضلك ادخل رقم الهاتف';
            }
            return null;
          },
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          prefixIcon: const Icon(Iconsax.direct),
          hintText: 'أدخل رقم الهاتف',
          controller: phoneController,
          onFieldSubmitted: (value) {
            phoneController.text = value;
          },
        ),
        verticalSpace(15),
        AppTextFormField(
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'من فضلك ادخل عنوانك';
            }
            return null;
          },
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          prefixIcon: const Icon(Iconsax.direct),
          hintText: 'أدخل عنوانك',
          controller: addressController,
          onFieldSubmitted: (value) {
            addressController.text = value;
          },
        ),
        verticalSpace(15),
        AppTextFormField(
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'من فضلك ادخل الرقم السري';
            }
            return null;
          },
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          controller: passWordController,
          hintText: "ادخل الرقم السري",
          prefixIcon: const Icon(Iconsax.password_check),
          onFieldSubmitted: (value) {
            passWordController.text = value;
          },
        ),
      ],
    );
  }
}
