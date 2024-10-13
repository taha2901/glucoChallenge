import 'package:challenge/features/home/ui/widgets/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicksOfServices extends StatelessWidget {
  const TicksOfServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Services(
            text: 'قياس السكر',
            icon: FontAwesomeIcons.hospital,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 23),
        Expanded(
          child: Services(
            onTap: () {},
            text: 'دكتور',
            icon: FontAwesomeIcons.userDoctor,
          ),
        ),
        const SizedBox(width: 23),
        const Expanded(
          child: Services(
            text: 'رياضه',
            icon: Icons.run_circle_sharp,
          ),
        ),
      ],
    );
  }
}
