import 'package:auto_size_text/auto_size_text.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/add_rate_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_comment_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NameAndStars extends StatelessWidget {
  final DoctorCommentResponse doctorComment;
  final AddRateResponse? addRateResponse;

  const NameAndStars({
    super.key,
    required this.doctorComment,
    this.addRateResponse,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(String createdAt) {
      final DateTime parsedDate = DateTime.parse(createdAt);
      final DateFormat formatter = DateFormat('d/M/yyyy'); // التنسيق المطلوب
      return formatter.format(parsedDate);
    }

    // نحصل على التقييم الفعلي من doctorComment أو addRateResponse
    // double rating = addRateResponse?.averageRate ?? 0.0;

    // عدد النجوم الذي سيتم إظهاره
    // int fullStars = rating.floor(); // عدد النجوم المملوءة
    // double fractionalStar =
    //     rating - fullStars; // القيمة العشرية (إذا كانت موجودة)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AutoSizeText(
              doctorComment.userName.toString(),
              style: TextStyles.font15DarkSemiBold,
            ),
            AutoSizeText(
              ' - ',
              style: TextStyles.font15DarkSemiBold,
            ),
            AutoSizeText(
              formatDate(
                  doctorComment.createdAt.toString()), // استدعاء دالة التنسيق
              style: TextStyles.font15DarkSemiBold,
            ),
          ],
        ),
        // Row(
        //   children: [
        //     // عرض النجوم المملوءة
        //     for (int i = 0; i < fullStars; i++)
        //       Icon(
        //         Icons.star,
        //         color: Colors.yellow,
        //       ),
        //     // إذا كان هناك تقييم جزئي (نجم نصف)
        //     if (fractionalStar > 0)
        //       Icon(
        //         Icons.star_half,
        //         color: Colors.yellow,
        //       ),
        //     // إذا كان هناك حاجة لإظهار النجوم الفارغة
        //     for (int i = fullStars + (fractionalStar > 0 ? 1 : 0); i < 5; i++)
        //       Icon(
        //         Icons.star_border,
        //         color: Colors.yellow,
        //       ),
        //   ],
        // ),
      ],
    );
  }
}
