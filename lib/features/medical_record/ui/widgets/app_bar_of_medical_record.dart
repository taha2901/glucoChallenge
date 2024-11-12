import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppBarOfMedicalRecord extends StatelessWidget {
  const AppBarOfMedicalRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        Text(
          'التقارير الطبية',
          style: TextStyles.font15DarkSemiBold,
        ),
        const Text('data', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
