import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/logic/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyFavouritesGridViewItem extends StatelessWidget {
  final FavouriteDoctorResponse? favouritesData;

  const MyFavouritesGridViewItem({
    super.key,
    this.favouritesData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                      favouritesData?.doctor?.photo ??
                          'https://student.valuxapps.com/storage/uploads/products/16445230161CiW8.Light bulb-amico.png',
                    ),
                  ),
                ),
                verticalSpace(10),
                Text('${favouritesData?.doctor?.userName}',
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  '\$${favouritesData?.doctor?.doctorspecialization}',
                  style: TextStyles.font16BlackBold,
                ),
                verticalSpace(10),
              ],
            ),
          ),
        ),
        BlocConsumer<FavouriteCubit, FavouriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Positioned(
              right: 15.h,
              top: 15.h,
              child: GestureDetector(
                onTap: () {
                  context.read<FavouriteCubit>().addOrRemoveFavourite(
                        doctorId: favouritesData?.doctor?.id ?? 0,
                      );
                },
                child: Image.asset(
                  'assets/images/fav-icon.png',
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}