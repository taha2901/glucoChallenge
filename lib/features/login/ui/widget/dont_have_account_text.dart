import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('أنشئ حساب جديد',style: TextStyles.font18BlueMedium,);
  }
}