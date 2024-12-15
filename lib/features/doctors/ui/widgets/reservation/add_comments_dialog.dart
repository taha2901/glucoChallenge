import 'package:challenge/features/doctors/data/model/add_comment_request_body.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddCommentDialog extends StatelessWidget {
  final int doctorId;

  const AddCommentDialog({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController contentController = TextEditingController();
    double userRate = 3.0; // التقييم الافتراضي (3 نجوم)

    return AlertDialog(
      title: Text('إضافة تعليق وتقييم'),
      content: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          state.maybeWhen(
            addCommentError: (apiErrorModel) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('حدث خطأ: ${apiErrorModel.getAllErrorMessages()}'),
                ),
              );
            },
            addCommentSuccess: (responseBody) {
              context.read<DoctorsCubit>().getDoctorComment(doctorId);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('تم إضافة التعليق والتقييم بنجاح'),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: 'التعليق',
                  border: OutlineInputBorder(),
                ),
              ),
              // يمكنك فك التعليق لتضمين تقييم النجوم
              // SizedBox(height: 16),
              // Text('التقييم:'),
              // RatingBar.builder(
              //   initialRating: userRate,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: true,
              //   itemCount: 5,
              //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              //   itemBuilder: (context, _) => Icon(
              //     Icons.star,
              //     color: Colors.amber,
              //   ),
              //   onRatingUpdate: (rating) {
              //     userRate = rating;
              //   },
              // ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            final String content = contentController.text.trim();

            if (content.isNotEmpty && userRate > 0) {
              final currentDate =
                  DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());

              final addCommentRequestBody = AddCommentRequestBody(
                id: 0,
                doctorId: doctorId,
                content: content,
                createdAt: currentDate,
                userName: "string",
                userProfilePictureUrl: "string",
                userId: "string",
              );

              BlocProvider.of<DoctorsCubit>(context)
                  .addComment(doctorId, addCommentRequestBody);

              Navigator.of(context).pop();
            }
          },
          child: Text('إضافة'),
        ),
      ],
    );
  }
}
