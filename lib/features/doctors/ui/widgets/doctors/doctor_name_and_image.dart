import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_name_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorNameAndImage extends StatelessWidget {
  const DoctorNameAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          doctorLoading: () {
            const CircularProgressIndicator();
          },
        );
      },
      builder: (context, state) {
        return state is DoctorSuccess
            ? const DoctorNameAndImageListView()
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
