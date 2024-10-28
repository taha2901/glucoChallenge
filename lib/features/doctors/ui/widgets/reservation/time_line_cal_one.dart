import 'package:challenge/features/doctors/ui/widgets/reservation/data_in_doctors.dart';
import 'package:flutter/material.dart';

class DateSelectionPage extends StatefulWidget {
  const DateSelectionPage({super.key, required this.onDateChange});

  final ValueChanged<DateTime> onDateChange;

  @override
  // ignore: library_private_types_in_public_api
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  DateTime? _selectedDate;

  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
    widget.onDateChange(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTimeLinedoctor(
          onDateChange: _onDateChange,
        ),
        
      ],
    );
  }
}
