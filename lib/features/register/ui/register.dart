import 'dart:io';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:challenge/features/register/logic/register_state.dart';
import 'package:challenge/features/register/ui/widgets/forms_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future pickerGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? myfile = await picker.pickImage(source: ImageSource.gallery);
    if (myfile != null) {
      setState(() {
        context.read<RegisterCubit>().image = File(myfile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (signupResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          error: (error) {
            setupErrorState(context, error.getAllErrorMessages());
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyles.font18BlackBold,
                    ),
                  ),
                  verticalSpace(20),
                  picImage(),
                  verticalSpace(20),
                  SignUpForm(),
                  verticalSpace(20),
                  AppTextButton(
                    backgroundColor: Colors.blue,
                    buttonText: 'تسجيل',
                    textStyle: TextStyles.font14WhiteMedium,
                    onPressed: () {
                      if (context
                          .read<RegisterCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<RegisterCubit>().emitSignupStates();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Center picImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage: context.read<RegisterCubit>().image != null
                ? FileImage(context.read<RegisterCubit>().image!)
                : null,
            child: context.read<RegisterCubit>().image == null
                ? const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blue,
                  )
                : null,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: pickerGallery,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 15,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content:
              const Text('Congratulations, you have signed up successfully!'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.pushNamed(Routers.login);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
