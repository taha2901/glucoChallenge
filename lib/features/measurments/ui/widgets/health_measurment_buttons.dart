import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthMeasurementButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color color;
  final Function onTap;

  const HealthMeasurementButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.14,
          height: MediaQuery.of(context).size.width * 0.14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: GestureDetector(
            onTap: () => onTap(),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Image.asset(
                imagePath,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        )
      ],
    );
  }
}
