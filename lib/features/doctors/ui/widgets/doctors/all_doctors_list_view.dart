import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_doctors_card.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/shimmer_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorsListView extends StatelessWidget {
  const AllDoctorsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          doctorLoading: () {
            const ShimmerAllDoctorsCard();
          },
        );
      },
      builder: (context, state) {
        return state is DoctorLoading
            ? const ShimmerAllDoctorsCard()
            : state is DoctorSuccess
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        DoctorsCubit.get(context).doctorResponseBody.length,
                    itemBuilder: (context, index) {
                      return AllDoctorsCard(
                        doctorResponseBody:
                            DoctorsCubit.get(context).doctorResponseBody[index],
                      );
                    },
                  )
                : state is DoctorError
                    ? Center(
                        child: Text(state.apiErrorModel.getAllErrorMessages()))
                    : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        DoctorsCubit.get(context).doctorResponseBody.length,
                    itemBuilder: (context, index) {
                      return AllDoctorsCard(
                        doctorResponseBody:
                            DoctorsCubit.get(context).doctorResponseBody[index],
                      );
                    },
                  );
      },
    );
  }
}
