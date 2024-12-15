// import 'package:challenge/core/theming/styles.dart';
// import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
// import 'package:challenge/features/favourite/ui/widget/my_favourites_grid_view.dart';
// import 'package:flutter/material.dart';

// class FavouriteBlocBuilder extends StatelessWidget {
//   const FavouriteBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FavouriteCubit.of(context)
//                 .favouriteList
//                 .isEmpty
//         ?  EmptyFavourite()
//         : MyFavouriteGridView();
//   }
// }

// class EmptyFavourite extends StatelessWidget {
//   const EmptyFavourite({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  [
//             Text('No Favourite', style: TextStyles.font16BlackBold,),
//             Image.asset('assets/images/suger2.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/logic/favourite_state.dart';
import 'package:challenge/features/favourite/ui/widget/favourite_shimmer_loading.dart';
import 'package:challenge/features/favourite/ui/widget/my_favourites_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouritesBlocBuilder extends StatelessWidget {
  const MyFavouritesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          favouriteLoading: () {
             FavouriteShimmerLoading();
          },
          addOrRemoveFavouriteSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                     'تم التعديل في المفضلة '
                    ),
                backgroundColor: Colors.green,
              ),
            );
          },
          addOrRemoveFavouriteError: ( message) {
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
        return MyFavouriteGridView();
      },
    );
  }
}

