import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/routings/routers.dart';
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
            onTap: () {
              context.pushNamed(Routers.measurement);
            },
          ),
        ),
        const SizedBox(width: 23),
        Expanded(
          child: Services(
            onTap: () {
              context.pushNamed(Routers.doctors);
            },
            text: 'دكتور',
            icon: FontAwesomeIcons.userDoctor,
          ),
        ),
        const SizedBox(width: 23),
        Expanded(
          child: Services(
            onTap: () {},
            text: 'رياضه',
            icon: Icons.run_circle_sharp,
          ),
        ),
      ],
    );
  }
}
