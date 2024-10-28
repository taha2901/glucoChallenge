import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldDropdown extends StatefulWidget {
  final Function(String?)? mealname;
  const CustomTextFieldDropdown({super.key, this.mealname});


  @override
  _CustomTextFieldDropdownState createState() =>
      _CustomTextFieldDropdownState();
}

class _CustomTextFieldDropdownState extends State<CustomTextFieldDropdown> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        hint: const Text("توقيت الوجبه"),
        value: selectedItem,
        items: ["بعد الاكل", "قبل الاكل"].map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value; // تعيين القيمة المحددة
          });
          widget.mealname!(value);
        },
        validator: (value) {
          if (value == null) {
            return 'يرجى اختيار خيار';
          }
          return null;
        },
      ),
    );
  }
}
