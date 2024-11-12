import 'package:challenge/core/helpers/app_regex.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passWordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (p0) =>
                p0 == null || p0.isEmpty ? 'من فضلك ادخل اسمك' : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            prefixIcon: const Icon(Icons.person),
            hintText: 'أدخل اسمك',
            controller: context.read<RegisterCubit>().nameController,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            validator: (p0) => p0 == null || p0.isEmpty
                ? 'من فضلك ادخل البريد الالكتروني'
                : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            prefixIcon: const Icon(Iconsax.direct),
            hintText: 'أدخل الايميل',
            controller: context.read<RegisterCubit>().emailController,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            validator: (p0) =>
                p0 == null || p0.isEmpty ? 'من فضلك ادخل رقم الهاتف' : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            prefixIcon: const Icon(Iconsax.direct),
            hintText: 'أدخل رقم الهاتف',
            controller: context.read<RegisterCubit>().phoneController,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            validator: (p0) =>
                p0 == null || p0.isEmpty ? 'من فضلك ادخل عنوانك' : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            prefixIcon: const Icon(Iconsax.direct),
            hintText: 'أدخل عنوانك',
            controller: context.read<RegisterCubit>().addressController,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            validator: (p0) =>
                p0 == null || p0.isEmpty ? 'من فضلك ادخل الرقم السري' : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            controller: context.read<RegisterCubit>().passWordController,
            hintText: "ادخل الرقم السري",
            prefixIcon: const Icon(Iconsax.password_check),
          ),
        ],
      ),
    );
  }
}
