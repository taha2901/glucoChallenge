import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownActivity extends StatefulWidget {
  final Function(String?)? onChanged;
  const DropdownActivity({super.key, this.onChanged});

  @override
  _DropdownActivityState createState() => _DropdownActivityState();
}

class _DropdownActivityState extends State<DropdownActivity> {
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
        hint: const Text("النشاط"),
        value: selectedItem,
        items: ["مشى", "جرى"].map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
          widget.onChanged!(value);
        },
        validator: (value) {
          if (value == null) {
            return 'يرجى اختيار نشاط';
          }
          return null;
        },
      ),
    );
  }
}
