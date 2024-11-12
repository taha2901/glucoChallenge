import 'package:challenge/core/widget/custom_show_toast.dart';
import 'package:challenge/features/doctors/logic/popular_doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/popular_doctors_state.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_famous_doctors/all_popular_doctors_list_view.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_famous_doctors/shimmer_popular_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPopularDoctors extends StatelessWidget {
  const AllPopularDoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularDoctorsCubit, PopularDoctorsState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          popularDoctorsLoading: () {
            const ShimmerPopularDoctorsList();
          },
          popularDoctorsSuccess: (doctor) {
            const PopularDoctorNameAndImageListView();
          },
          popularDoctorsError: (apiErrorModel) {
            showToast(
                msg: apiErrorModel.getAllErrorMessages(),
                state: ToastStates.ERROR);
          },
        );
      },
      builder: (context, state) {
        return state is PopularDoctorsSuccess
            ? const PopularDoctorNameAndImageListView()
            : state is PopularDoctorsLoading
                ? const ShimmerPopularDoctorsList()
                : state is PopularDoctorsError
                    ? Center(
                        child: Text(state.apiErrorModel.getAllErrorMessages()))
                    : const Center(child: Text('No data'));
      },
    );
  }
}
