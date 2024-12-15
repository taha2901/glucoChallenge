import 'package:challenge/features/doctors/ui/widgets/doctors/all_favourite_doctors/all_favourite_doctor_list_view.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_favourite_doctors/shimmer_favourite_doctor.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/logic/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllFavouriteDoctor extends StatelessWidget {
  const AllFavouriteDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          favouriteLoading: () {
            ShimmerDoctorList();
          },
          addOrRemoveFavouriteSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('تم التعديل في المفضلة '),
                backgroundColor: Colors.green,
              ),
            );
          },
          addOrRemoveFavouriteError: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('حدث خطأ أثناء تعديل المفضلة'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state is FavouriteLoading
            ? ShimmerDoctorList()
            : AllFavouriteDoctorListView();
      },
    );
  }
}
