import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ConfirmReservationAppBar extends StatelessWidget {
  const ConfirmReservationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_ios_new_rounded),
        Text(
          'حجز',
          style: TextStyles.font18BlackMedium,
        ),
        const Text(
          'data',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
