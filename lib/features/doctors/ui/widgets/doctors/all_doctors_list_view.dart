import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorsListView extends StatelessWidget {
  const AllDoctorsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DoctorsCubit.get(context).doctorResponseBody.length,
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
