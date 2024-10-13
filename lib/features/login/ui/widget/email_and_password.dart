import 'package:challenge/core/helpers/app_regex.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;
  bool hasValidated = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }
  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            hintText: 'أدخل البريد الالكتروني',
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'من فضلك ادخل بريد الكتروني صحيح';
              }
              return null;
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك ادخل كلمة المرور';
              }
              return null;
            },
            hintText: 'أدخل كلمة المرور',
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
