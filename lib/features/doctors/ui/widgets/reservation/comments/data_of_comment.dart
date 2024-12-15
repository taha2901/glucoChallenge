import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/add_rate_response.dart';
import 'package:challenge/features/doctors/data/model/doctor_comment_response.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/comments/name_and_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataOfCommment extends StatelessWidget {
  final DoctorCommentResponse doctorComment;
  final AddRateResponse? addRateResponse;

  const DataOfCommment({
    super.key,
    required this.doctorComment, this.addRateResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage:
                  NetworkImage(doctorComment.userProfilePictureUrl.toString()),
            ),
            horizontalSpace(8),
            NameAndStars(
              doctorComment: doctorComment,
              addRateResponse: addRateResponse,  // تم تمرير التقييم المحدث هنا
            ),
          ],
        ),
        verticalSpace(8),
        Text(
          doctorComment.content.toString(),
          style: TextStyles.font13DarkBlue,
        ),
      ],
    );
  }
}
