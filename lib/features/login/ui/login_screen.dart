import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/login/ui/widget/dont_have_account_text.dart';
import 'package:challenge/features/login/ui/widget/login_bloc_listenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/email_and_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('تسجيل الدخول', style: TextStyles.font15BlackBold),
              verticalSpace(10),
              Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(24),
                  AppTextButton(
                    buttonText: 'تسجيل الدخول',
                    textStyle: TextStyles.font14WhiteMedium,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  const DontHaveAccountText(),
                  const LoginBlocListenter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(context);
    }
  }
}
