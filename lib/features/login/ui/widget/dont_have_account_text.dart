import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routers.register),
      child: Text('أنشئ حساب جديد',style: TextStyles.font18BlueMedium,));
  }
}