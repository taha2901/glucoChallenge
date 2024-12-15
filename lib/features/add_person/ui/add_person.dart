import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/helpers/email_services.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/add_person/data/repo/add_person_repo.dart';
import 'package:challenge/features/add_person/logic/add_person_cubit.dart';
import 'package:challenge/features/add_person/logic/add_person_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// class AddPerson extends StatelessWidget {
//   const AddPerson({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//     return BlocProvider(
//       create: (context) => getit<AddPersonCubit>(),
//       child: BlocConsumer<AddPersonCubit, AddPersonState>(
//         listener: (context, state) {
//           if (state is AddPersonSuccess) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   icon: const Icon(
//                     Icons.check,
//                     color: Colors.green,
//                     size: 32,
//                   ),
//                   content: Text(
//                     'تم الاضافه بنجاح',
//                     style: TextStyles.font15DarkSemiBold,
//                   ),
//                 );
//               },
//             ).then((_) {
//               // ننتظر لبعض الوقت بعد إغلاق الـ Dialog لإغلاق الصفحة
//               Future.delayed(Duration(seconds: 1), () {
//                 Navigator.pop(context);
//               });
//             });
//           }

//           if (state is AddPersonError) {
//             showToast(
//                 msg: state.apiErrorModel.getAllErrorMessages(),
//                 state: ToastStates.ERROR);
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//             ),
//             body: Center(
//               child: SingleChildScrollView(
//                 // Wrap Column in SingleChildScrollView
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         textAlign: TextAlign.center,
//                         style: TextStyles.font15DarkSemiBold,
//                         'هل تريد احد الاشخاص المقربين ان يتابع معك مستوي \nالسكر و مواعيد الدواء و مستوي الصحه عندك ',
//                       ),
//                       verticalSpace(16),
//                       AppTextFormField(
//                         controller:
//                             context.read<AddPersonCubit>().emailController,
//                         hintText: 'ادخل اميل',
//                         prefixIcon: const Icon(Icons.email,
//                             color: ColorsManager.lightGrey),
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             context
//                                 .read<AddPersonCubit>()
//                                 .emailController
//                                 .clear();
//                           },
//                           child: Icon(Iconsax.close_circle,
//                               color: ColorsManager.lightGrey), // Add a child
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       verticalSpace(16),
//                       AppTextFormField(
//                         controller:
//                             context.read<AddPersonCubit>().phoneController,
//                         hintText: 'رقم التلفون',
//                         prefixIcon: const Icon(Icons.phone,
//                             color: ColorsManager.lightGrey),
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             context
//                                 .read<AddPersonCubit>()
//                                 .phoneController
//                                 .clear();
//                           },
//                           child: Icon(Iconsax.close_circle,
//                               color: ColorsManager.lightGrey), // Add a child
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       verticalSpace(16),
//                       AppTextFormField(
//                         controller:
//                             context.read<AddPersonCubit>().relationController,
//                         hintText: 'الصفه',
//                         prefixIcon: const Icon(Iconsax.user,
//                             color: ColorsManager.lightGrey),
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             context
//                                 .read<AddPersonCubit>()
//                                 .relationController
//                                 .clear();
//                           },
//                           child: Icon(Iconsax.close_circle,
//                               color: ColorsManager.lightGrey), // Add a child
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       verticalSpace(64),
//                       AppTextButton(
//                         buttonText: state is AddPErsonLoading
//                             ? '...جاري التحميل'
//                             : 'اضافه',
//                         icon: Iconsax.add_circle_copy,
//                         textStyle: TextStyles.font15Whiteregular,
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             context.read<AddPersonCubit>().addPerson(
//                                   email: context
//                                       .read<AddPersonCubit>()
//                                       .emailController
//                                       .text
//                                       .trim(),
//                                   phone: context
//                                       .read<AddPersonCubit>()
//                                       .phoneController
//                                       .text
//                                       .trim(),
//                                   relation: context
//                                       .read<AddPersonCubit>()
//                                       .relationController
//                                       .text
//                                       .trim(),
//                                 );
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class AddPerson extends StatelessWidget {
  const AddPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AddPersonCubit(
        getit<AddPersonRepo>(),
        getit<NotificationService>(),
        getit<EmailService>(), // تأكد من أن NotificationService متاحة
      ),
      child: BlocConsumer<AddPersonCubit, AddPersonState>(
        listener: (context, state) {
          if (state is AddPersonSuccess) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 32,
                  ),
                  content: Text(
                    'تم الاضافه بنجاح',
                    style: TextStyles.font15DarkSemiBold,
                  ),
                );
              },
            ).then((_) {
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            });
          }

          if (state is AddPersonError) {
            showToast(
                msg: state.apiErrorModel.getAllErrorMessages(),
                state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        style: TextStyles.font15DarkSemiBold,
                        'هل تريد احد الاشخاص المقربين ان يتابع معك مستوي \nالسكر و مواعيد الدواء و مستوي الصحه عندك ',
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller:
                            context.read<AddPersonCubit>().emailController,
                        hintText: 'ادخل اميل',
                        prefixIcon: const Icon(Icons.email,
                            color: ColorsManager.lightGrey),
                        suffixIcon: InkWell(
                          onTap: () {
                            context
                                .read<AddPersonCubit>()
                                .emailController
                                .clear();
                          },
                          child: Icon(Iconsax.close_circle,
                              color: ColorsManager.lightGrey),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller:
                            context.read<AddPersonCubit>().phoneController,
                        hintText: 'رقم التلفون',
                        prefixIcon: const Icon(Icons.phone,
                            color: ColorsManager.lightGrey),
                        suffixIcon: InkWell(
                          onTap: () {
                            context
                                .read<AddPersonCubit>()
                                .phoneController
                                .clear();
                          },
                          child: Icon(Iconsax.close_circle,
                              color: ColorsManager.lightGrey),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller:
                            context.read<AddPersonCubit>().relationController,
                        hintText: 'الصفه',
                        prefixIcon: const Icon(Iconsax.user,
                            color: ColorsManager.lightGrey),
                        suffixIcon: InkWell(
                          onTap: () {
                            context
                                .read<AddPersonCubit>()
                                .relationController
                                .clear();
                          },
                          child: Icon(Iconsax.close_circle,
                              color: ColorsManager.lightGrey),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      verticalSpace(64),
                      AppTextButton(
                        buttonText: state is AddPErsonLoading
                            ? '...جاري التحميل'
                            : 'اضافه',
                        icon: Iconsax.add_circle_copy,
                        textStyle: TextStyles.font15Whiteregular,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AddPersonCubit>().addPerson(
                                  email: context
                                      .read<AddPersonCubit>()
                                      .emailController
                                      .text
                                      .trim(),
                                  phone: context
                                      .read<AddPersonCubit>()
                                      .phoneController
                                      .text
                                      .trim(),
                                  relation: context
                                      .read<AddPersonCubit>()
                                      .relationController
                                      .text
                                      .trim(),
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
      ),
    );
  }
}
