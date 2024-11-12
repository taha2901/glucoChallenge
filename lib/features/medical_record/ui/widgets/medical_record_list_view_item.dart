import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/medical_record/data/model/delete_medical_record/datum.dart';
import 'package:challenge/features/medical_record/data/model/medical_record/datum.dart';
import 'package:challenge/features/medical_record/logic/medical_record_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordListViewItem extends StatelessWidget {
  final Datum medicalRecord;
  const MedicalRecordListViewItem({
    super.key,
    required this.medicalRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.r,
                  backgroundImage: NetworkImage(
                    medicalRecord.doctor?.photo ?? "",
                  ),
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicalRecord.doctor?.name ?? "",
                      style: TextStyles.font18BlueBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.doctor?.address ?? "No Address",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.time ?? "",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.shopping_cart_checkout_sharp,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.doctor?.price.toString() ?? "",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              BlocConsumer<DoctorsCubit, DoctorsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    deleteReservationSuccess: (deleteReservaionResponse) {
                      context.read<MedicalRecordCubit>().getMedicalRecord();
                      showToast(
                          msg: "تم حذف الحجز", state: ToastStates.SUCCESS);
                    },
                    deleteReservationError: (apiErrorModel) {
                      showToast(
                          msg: apiErrorModel.getAllErrorMessages(),
                          state: ToastStates.ERROR);
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context.read<DoctorsCubit>().deleteReservation(
                              medicalRecord.reservationId ?? 0,
                              context,
                            );
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteMedicalRecordListViewItem extends StatelessWidget {
  final DeleteDatum medicalRecord;
  const DeleteMedicalRecordListViewItem({
    super.key,
    required this.medicalRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.r,
                  backgroundImage: NetworkImage(
                    medicalRecord.doctor?.photo ?? "",
                  ),
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicalRecord.doctor?.name ?? "",
                      style: TextStyles.font18BlueBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.doctor?.address ?? "No Address",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.time ?? "",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.shopping_cart_checkout_sharp,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Text(
                          medicalRecord.doctor?.price.toString() ?? "",
                          style: TextStyles.font15DarkBlueMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Spacer(),
              // BlocConsumer<DoctorsCubit,  DoctorsState>(
              //   listener: (context, state) {
              //     state.maybeWhen(
              //       deleteReservationSuccess: (  deleteReservaionResponse) {
              //         context.read<MedicalRecordCubit>().getMedicalRecord();
              //         showToast(msg: "تم حذف الحجز", state:  ToastStates.SUCCESS);
              //       },
              //       deleteReservationError: (apiErrorModel) {
              //         showToast(msg: apiErrorModel.getAllErrorMessages(), state: ToastStates.ERROR);
              //       },
              //       orElse: () {},
              //     );
              //   },
              //   builder: (context, state) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: InkWell(
              //         onTap: () {
              // context.read<DoctorsCubit>().emitReservationStates(
              //       age:  medicalRecord.age ?? 0,
              //       date:  medicalRecord.date ?? "",
              //       doctorId:  medicalRecord.doctor?.id ?? 0,
              //       phone:  medicalRecord.phone ?? "",
              //       sex:  medicalRecord.sex ?? "",
              //       time:  medicalRecord.time ?? "",
              //       username:  medicalRecord.username ?? "",
              //       context: context
              //     );
              // },
              //         child: Icon(
              //           Icons.refresh,
              //           color: Colors.blue,
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
