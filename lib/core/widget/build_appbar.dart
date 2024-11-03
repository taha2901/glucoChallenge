import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildApBar extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  const BuildApBar({
    super.key,
    this.title, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
        ),
        title == null
            ? const SizedBox()
            : Text(
                title.toString(),
                style: style,
              ),
        const Text('(12)', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
