import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPrefHelper.getStringg('photoUrl'),
      builder: (context, snapshot) {
        String? photoUrl = snapshot.data;
        return Row(
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(Routers.profile),
              child: CircleAvatar(
                radius: 23.r,
                backgroundImage: photoUrl != null && photoUrl.isNotEmpty
                    ? NetworkImage(photoUrl)
                    : null,
                child: photoUrl == null || photoUrl.isEmpty
                    ? const Icon(Icons.person)
                    : null,
              ),
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أهلا',
                  style: TextStyles.font17GreySemiBold,
                ),
                FutureBuilder<String?>(
                  future: SharedPrefHelper.getStringg('name'),
                  builder: (context, snapShot) {
                    // نستخدم snapShot بدلاً من snapshot هنا
                    String? name = snapShot.data;
                    return Text(
                      name ?? '', // عرض النص الفارغ في حالة عدم وجود اسم
                      style: TextStyles.font17GreySemiBold,
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () => context.pushNamed(Routers.chatbot),
              child: CircleAvatar(
                radius: 23.r,
                backgroundImage: const AssetImage('assets/images/chatbot.png'),
              ),
            ),
          ],
        );
      },
    );
  }
}
