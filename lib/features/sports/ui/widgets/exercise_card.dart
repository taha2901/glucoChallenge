import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/sports/data/model/exercise_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(exercise.moreInfoUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  exercise.photo,
                ),
                radius: 50.r,
              )),
          horizontalSpace(8),
          Expanded(
            child: Text(
              exercise.description,
              style: TextStyles.font12greyRegular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _launchURL,
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: ColorsManager.mainTextGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text('عرض', style: TextStyles.font18WhiteBold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
