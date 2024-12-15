
import 'package:challenge/features/doctors/logic/popular_doctors_cubit.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/all_famous_doctors/all_popular_doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class PopularDoctorNameAndImageListView extends StatelessWidget {
  const PopularDoctorNameAndImageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: PopularDoctorsCubit.get(context).popularDoctorResponseBody.length,
        itemBuilder: (context, index) {
          return PopularDoctorNameAndImageItem(
              doctor: PopularDoctorsCubit.get(context).popularDoctorResponseBody[index]);
        },
      ),
    );
  }
}
