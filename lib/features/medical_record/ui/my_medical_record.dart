import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/medical_record/logic/medical_record_cubit.dart';
import 'package:challenge/features/medical_record/logic/medical_record_state.dart';
import 'package:challenge/features/medical_record/ui/widgets/app_bar_of_medical_record.dart';
import 'package:challenge/features/medical_record/ui/widgets/medical_record_list_view_item.dart';
import 'package:challenge/features/medical_record/ui/widgets/reservation_report_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMedicalRecord extends StatelessWidget {
  const MyMedicalRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalRecordCubit, MedicalRecordState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loading: () {
            const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (medicalRecord) {
            // context.read<MedicalRecordCubit>().getMedicalRecord();
          },
          error: (errorModel) {
            showToast(
                msg: errorModel.getAllErrorMessages(),
                state: ToastStates.ERROR);
          },
        );
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const AppBarOfMedicalRecord(),
                  verticalSpace(8),
                  const ReservationsReportOptions(),
                  TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: "تم حجزه"),
                      Tab(text: "تم الإلغاء"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      const ReservationTab(),
                      const DeleteReservationTab(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReservationTab extends StatelessWidget {
  const ReservationTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(8),
        Expanded(
          child: ListView.builder(
            itemCount: context
                    .read<MedicalRecordCubit>()
                    .medicalRecord
                    ?.data
                    ?.length ??
                0,
            itemBuilder: (context, index) {
              final medicalRecord =
                  context.read<MedicalRecordCubit>().medicalRecord;
              if (medicalRecord != null && medicalRecord.data != null) {
                return MedicalRecordListViewItem(
                  medicalRecord: medicalRecord.data![index],
                );
              } else {
                return const Center(child: Text('No Data'));
              }
            },
          ),
        ),
      ],
    );
  }
}




class DeleteReservationTab extends StatelessWidget {
  const DeleteReservationTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(8),
        Expanded(
          child: ListView.builder(
            itemCount: context
                    .read<MedicalRecordCubit>()
                    .deleteMedicalRecord
                    ?.data
                    ?.length ??
                0,
            itemBuilder: (context, index) {
              final deleteMedicalRecord =
                  context.read<MedicalRecordCubit>().deleteMedicalRecord;
              if (deleteMedicalRecord != null && deleteMedicalRecord.data != null) {
                return DeleteMedicalRecordListViewItem(
                  medicalRecord: deleteMedicalRecord.data![index],
                );
              } else {
                return const Center(child: Text('No Data'));
              }
            },
          ),
        ),
      ],
    );
  }
}
