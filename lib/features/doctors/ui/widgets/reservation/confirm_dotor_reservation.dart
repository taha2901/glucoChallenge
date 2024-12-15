import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/app_text_button.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/comments/data_of_comment.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/comments_header.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/define_doc_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_reservation_app_bar.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/time_line_cal_one.dart';
import 'package:challenge/features/payment/ui/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ConfirmDoctorReservation extends StatefulWidget {
  final String? username;
  final String? sex;
  final int? age;
  final String? phone;
  String? time;
  final int? doctorId;
  final DoctorResponseBody? doctorResponseBody;

  ConfirmDoctorReservation({
    super.key,
    this.username,
    this.sex,
    this.age,
    this.phone,
    this.time,
    this.doctorId,
    this.doctorResponseBody,
  });

  @override
  State<ConfirmDoctorReservation> createState() =>
      _ConfirmDoctorReservationState();
}

class _ConfirmDoctorReservationState extends State<ConfirmDoctorReservation> {
  @override
  initState() {
    super.initState();
    context.read<DoctorsCubit>().getDoctorComment(widget.doctorId!);
  }

  DateTime? _selectedDate;

  void _onDateChange(DateTime selectedDate) {
    setState(
      () {
        _selectedDate = selectedDate;
        String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);

        if (widget.doctorId != null) {
          context.read<DoctorsCubit>().getAvailableTime(
                widget.doctorId!,
                formattedDate,
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          children: [
            ConfirmReservationAppBar(),
            DefineInReservation(
              doctorResponseBody: widget.doctorResponseBody,
            ),
            verticalSpace(16),
            Expanded(
              child: BlocConsumer<DoctorsCubit, DoctorsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          'الأيام',
                          style: TextStyles.font18BlackBold,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: DateSelectionPage(onDateChange: _onDateChange),
                      ),
                      SliverToBoxAdapter(
                        child: verticalSpace(16),
                      ),
                      SliverToBoxAdapter(
                        child: BlocBuilder<DoctorsCubit, DoctorsState>(
                          builder: (context, state) {
                            if (_selectedDate == null) {
                              return const Center(
                                  child: Text('يرجى تحديد التاريخ أولاً'));
                            }
                            return BlocConsumer<DoctorsCubit, DoctorsState>(
                              listener: (context, state) {
                                if (state is AvailableTimeLoading) {
                                  const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is AvailableTimeError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'حدث خطأ: ${state.apiErrorModel.getAllErrorMessages()}'),
                                    ),
                                  );
                                }
                                if (state is ReservationSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                          'تم الحجز بنجاح: ${state.reservationResponse.message}'),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is AvailableTimeSuccess) {
                                  return SizedBox(
                                    height: 120.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.availableTimeResponse
                                          .availableTimes.length,
                                      itemBuilder: (context, index) {
                                        String timeStr = state
                                            .availableTimeResponse
                                            .availableTimes[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.time = timeStr;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: (widget.time == timeStr)
                                                  ? Colors.blueAccent
                                                  : Colors.grey.shade300,
                                            ),
                                            width: 100.w,
                                            child: Center(
                                              child: Text(
                                                timeStr,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      (widget.time == timeStr)
                                                          ? Colors.white
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return const Center(child: Text(''));
                                }
                              },
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: verticalSpace(16),
                      ),
                      SliverToBoxAdapter(
                        child: AppTextButton(
                          borderRadius: 10,
                          buttonText: 'تأكيد',
                          textStyle: TextStyles.font18WhiteBold,
                          onPressed: () {
                            if (_selectedDate != null && widget.time != null) {
                              String formattedDate =
                                  _selectedDate!.toIso8601String();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCartView(
                                    age: widget.age,
                                    doctorId: widget.doctorId,
                                    phone: widget.phone,
                                    sex: widget.sex,
                                    username: widget.username,
                                    time: widget.time,
                                    selectedDate: formattedDate.toString(),
                                    doctorResponseBody:
                                        widget.doctorResponseBody,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'يرجى تحديد التاريخ والوقت أولاً')),
                              );
                            }
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: verticalSpace(16),
                      ),
                      SliverToBoxAdapter(
                        child: CommentsHeader(widget: widget),
                      ),
                      SliverToBoxAdapter(
                        child: Divider(thickness: 2),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return DataOfCommment(
                              doctorComment: context
                                  .read<DoctorsCubit>()
                                  .doctorCommentResponse[index],
                            );
                          },
                          childCount: context
                              .read<DoctorsCubit>()
                              .doctorCommentResponse
                              .length,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
