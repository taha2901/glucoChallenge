import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/core/widget/build_appbar.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
import 'package:challenge/features/payment/logic/payment_cubit.dart';
import 'package:challenge/features/payment/ui/thank_you_view.dart';
import 'package:challenge/features/payment/ui/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MyCartViewBody extends StatefulWidget {
  final String? username;
  final String? sex;
  final int? age;
  final String? phone;
  final String? time;
  final int? doctorId;
  final String? selectedDate;
  final DoctorResponseBody? doctorResponseBody;

  const MyCartViewBody({
    super.key,
    this.username,
    this.sex,
    this.age,
    this.phone,
    this.doctorId,
    this.time,
    this.selectedDate,
    this.doctorResponseBody,
  });

  @override
  _MyCartViewBodyState createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  bool isCashSelected = false;
  bool isCardSelected = false;

  void togglePaymentMethod(bool isCash) {
    setState(() {
      if (isCash) {
        isCashSelected = true;
        isCardSelected = false;
      } else {
        isCashSelected = false;
        isCardSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildApBar(
            title: 'الدفع',
            style: TextStyles.font18MainTextGrey,
          ),
          verticalSpace(8),
          Text(
            'ألعنوان',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(16),
          Row(
            children: [
              const Icon(
                Iconsax.location,
                color: ColorsManager.mainBlue,
              ),
              horizontalSpace(8),
              Text(
                widget.doctorResponseBody!.address.toString(),
                style: TextStyles.font18MainTextGrey,
              ),
            ],
          ),
          const Divider(thickness: 2),
          verticalSpace(8),
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsManager.moreLighterGray,
            ),
            child: Row(
              children: [
                Image.asset('assets/images/Group.png',
                    height: 60.h, width: 60.w),
                horizontalSpace(8),
                Text(
                  'الدفع عند الوصول',
                  style: TextStyles.font15greyBold,
                ),
                const Spacer(),
                Checkbox(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                  value: isCashSelected,
                  onChanged: (value) => togglePaymentMethod(true),
                ),
              ],
            ),
          ),
          verticalSpace(8),
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsManager.moreLighterGray,
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/card.svg',
                    height: 45.h, width: 45.w),
                horizontalSpace(8),
                Text(
                  '**** ***** ***** 2367',
                  style: TextStyles.font15greyBold,
                ),
                const Spacer(),
                Checkbox(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                  value: isCardSelected,
                  onChanged: (value) => togglePaymentMethod(false),
                ),
              ],
            ),
          ),
          const Spacer(),
          verticalSpace(3),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          TotalPrice(
            title: 'Total',
            value:
                '\$${widget.doctorResponseBody!.detectionPrice.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 16),
          AppTextButton(
            buttonText: 'تأكيد الحجز',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () async {
              // تحقق من أن معلومات الدفع موجودة
              if (widget.doctorResponseBody != null) {
                // Debugging details
                debugPrint('age: ${widget.age}');
                debugPrint('phone: ${widget.phone}');
                debugPrint('username: ${widget.username}');
                debugPrint('time: ${widget.time}');
                debugPrint('selectedDate: ${widget.selectedDate}');

                // إذا كان الدفع عند الوصول مفعلًا
                if (isCashSelected) {
                  // مباشرةً قم بعملية الحجز باستخدام DoctorsCubit
                  context.read<DoctorsCubit>().emitReservationStates(
                        username: widget.username.toString(),
                        phone: widget.phone.toString(),
                        age: widget.age ?? 0,
                        sex: widget.sex.toString(),
                        doctorId: widget.doctorId!,
                        time: widget.time.toString(),
                        date: widget.selectedDate.toString(),
                      );

                  
                } else if (isCardSelected) {
                  // إعداد الدفع
                  PaymentIntentInputModel paymentIntentInput =
                      PaymentIntentInputModel(
                    amount:
                        widget.doctorResponseBody!.detectionPrice.toString(),
                    currency: 'usd',
                    customerId: 'cus_R91SwryFhueagp',
                  );

                  // عملية الدفع باستخدام PaymentCubit
                  bool paymentSuccess = await BlocProvider.of<PaymentCubit>(
                    context,
                  ).makePayment(
                    paymentIntentInputModel: paymentIntentInput,
                  );

                  if (paymentSuccess) {
                    context.read<DoctorsCubit>().emitReservationStates(
                          username: widget.username.toString(),
                          phone: widget.phone.toString(),
                          age: widget.age ?? 0,
                          sex: widget.sex.toString(),
                          doctorId: widget.doctorId!,
                          time: widget.time.toString(),
                          date: widget.selectedDate.toString(),
                        );

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ThankYouView(
                          doctorResponseBody: widget.doctorResponseBody,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('حدث خطأ أثناء الدفع')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('يرجى اختيار طريقة الدفع')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('معلومات الدفع غير متوفرة')),
                );
              }
            },
            backgroundColor: ColorsManager.mainColor,
            borderRadius: 10.0,
            buttonHeight: 50.h,
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
