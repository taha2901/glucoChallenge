import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/features/favourite/ui/widget/favourite_app_bar.dart';
import 'package:challenge/features/favourite/ui/widget/my_favourites_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
          child: Column(
            children: [
              const FavouriteAppBar(),
              verticalSpace(24),
              Expanded(
                child: MyFavouritesBlocBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
