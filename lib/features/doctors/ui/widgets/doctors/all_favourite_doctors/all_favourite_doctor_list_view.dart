import 'package:challenge/features/doctors/ui/widgets/doctors/all_favourite_doctors/all_favourite_doctor_list_view_item.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:flutter/material.dart';

class AllFavouriteDoctorListView extends StatelessWidget {
  const AllFavouriteDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: FavouriteCubit.of(context).favouriteList.length,
      itemBuilder: (context, index) {
        return AllFavouriteDoctorListViewItem(
          favouritesData: FavouriteCubit.of(context).favouriteList[index],
        );
      },
    );
  }
}
