import 'dart:io';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:challenge/features/register/logic/register_state.dart';
import 'package:challenge/features/register/ui/widgets/component.dart';
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
  File? _file;

  Future pickerGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? myfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  var imageController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            setupErrorState(context, error);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text('إنشاء حساب',
                            style: Theme.of(context).textTheme.bodyLarge)),
                    const SizedBox(
                      height: 30.0,
                    ),
                    picImage(),
                    FormsField(
                      nameController: nameController,
                      emailController: emailController,
                      passWordController: passWordController,
                      phoneController: phoneController,
                      addressController: addressController,
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      backgroundColor: Colors.blue,
                      buttonText: 'تسجيل',
                      textStyle: TextStyles.font14WhiteMedium,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          RegisterCubit.get(context).userRegister(
                            username: nameController.text,
                            email: emailController.text,
                            address: addressController.text,
                            password: passWordController.text,
                            phone: phoneController.text,
                            image: _file!,
                          );
                        }
                      },
                    ),
                  ],
                ),
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
            backgroundImage: _file != null ? FileImage(_file!) : null,
            child: _file == null
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
              onTap: () {
                pickerGallery();
              },
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
}
