import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/add_comments_dialog.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:flutter/material.dart';

class CommentsHeader extends StatelessWidget {
  const CommentsHeader({
    super.key,
    required this.widget,
  });

  final ConfirmDoctorReservation widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'التعليقات',
          style: TextStyles.font15DarkSemiBold,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AddCommentDialog(doctorId: widget.doctorId!),
            );
          },
          child: Row(
            children: [
              Text(
                'إضافة تعليق',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              horizontalSpace(8),
              const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
