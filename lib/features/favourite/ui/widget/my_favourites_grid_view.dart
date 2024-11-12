import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/ui/widget/my_favourites_grid_view_item.dart';
import 'package:flutter/material.dart';

class MyFavouriteGridView extends StatelessWidget {
  const MyFavouriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
      shrinkWrap: true, // Allow the GridView to take only the space it needs
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1 / 1.4,
      ),
      itemCount: FavouriteCubit.of(context).favouriteList.length,
      itemBuilder: (context, index) {
        return MyFavouritesGridViewItem(
          favouritesData: FavouriteCubit.of(context).favouriteList[index],
        );
      },
    );
  }
}
