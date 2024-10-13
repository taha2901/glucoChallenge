
import 'package:challenge/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'بحث',
      textAlign: TextAlign.center,
      borderRadius: BorderRadius.circular(10),
      suffixIcon: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Image.asset(
            'assets/images/Iconly.png',
            height: 30.h,
            width: 30.w,
          ),
        ),
      ),
      prefixIcon: Icon(
        Icons.search,
        size: 35.sp,
      ),
    );
  }
}
