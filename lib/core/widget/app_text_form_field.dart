import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final BorderRadius borderRadius;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final Color? backFroundColor;
  final bool? isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final TextAlign textAlign;
  final String? suffixText;
  final String? prefixText;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.isObscureText,
    this.suffixIcon,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.inputTextStyle,
    this.backFroundColor,
    this.validator,
    this.controller,
    this.prefixIcon,
    required this.borderRadius,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.suffixText,
    this.prefixText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,

      controller: controller,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        return validator?.call(value);
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixText: suffixText,
        prefixText: prefixText,

        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),

        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  const BorderSide(color: ColorsManager.mainColor, width: 1.3),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  const BorderSide(color: ColorsManager.lighterGrey, width: 2),
            ),
        errorBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(5)),
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(5)),
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
        hintText: hintText,

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backFroundColor ?? ColorsManager.lighterGrey,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      // style: TextStyles.font14DarkBlueMedium,
    );
  }
}
