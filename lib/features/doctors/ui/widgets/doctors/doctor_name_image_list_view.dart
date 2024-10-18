import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/ui/widgets/doctors/doctor_name_image_item.dart';
import 'package:flutter/material.dart';

class DoctorNameAndImageListView extends StatelessWidget {
  const DoctorNameAndImageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DoctorsCubit.get(context).doctorResponseBody.length,
        itemBuilder: (context, index) {
          return DoctorNameAndImageItem(
              doctor: DoctorsCubit.get(context).doctorResponseBody[index]);
        },
      ),
    );
  }
}
