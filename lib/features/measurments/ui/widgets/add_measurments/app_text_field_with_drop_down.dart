import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:challenge/core/theming/colors.dart';

class AppTextFieldWithDropdown extends StatefulWidget {
  final String hintText;
  final String? suffixText;
  final Function(String?)? onChanged;
  final Function(String?)? onDropdownChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final TextAlign textAlign;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final String? prefixText;
  final TextInputType? keyboardType;

  const AppTextFieldWithDropdown({
    super.key,
    required this.hintText,
    this.suffixText,
    this.onChanged,
    this.onDropdownChanged,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.inputTextStyle,
    this.textAlign = TextAlign.start,
    this.isObscureText = false,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.backgroundColor,
    this.prefixText,
    this.keyboardType,
  });

  @override
  _AppTextFieldWithDropdownState createState() =>
      _AppTextFieldWithDropdownState();
}

class _AppTextFieldWithDropdownState extends State<AppTextFieldWithDropdown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            validator: widget.validator,
            obscureText: widget.isObscureText ?? false,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            decoration: InputDecoration(
              suffixText: widget.suffixText,
              prefixText: widget.prefixText,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              isDense: true,
              contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsManager.mainColor, width: 1.3),
              ),
              enabledBorder: widget.enabledBorder ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsManager.lighterGrey, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red, width: 1.3),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              fillColor: widget.backgroundColor ?? ColorsManager.lighterGrey,
              filled: true,
            ),
          ),
          SizedBox(height: 10.h),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsManager.mainColor, width: 1.3),
              ),
              enabledBorder: widget.enabledBorder ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsManager.lighterGrey, width: 2),
              ),
            ),
            hint: Text("اختار ${widget.hintText}"),
            value: selectedItem,
            items: ["بعد الاكل", "قبل الاكل"].map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
              if (widget.onDropdownChanged != null) {
                widget.onDropdownChanged!(value);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى اختيار خيار';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
