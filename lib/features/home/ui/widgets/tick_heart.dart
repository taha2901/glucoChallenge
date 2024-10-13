// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // ignore: must_be_immutable
// class TicksOfHeart extends StatelessWidget {
//   TicksOfHeart({
//     super.key,
//   });
//   int? heartlenght;
//   String? heartrate;
//   @override
//   Widget build(BuildContext context) {
//     DateTime currentDate = DateTime.now();
//     String formattedDate =
//         "${currentDate.year}-${currentDate.month}-${currentDate.day}";
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               PresssureCheckCubit()..fetchpressuredata(formattedDate),
//         ),
//       ],
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           double containerWidth = constraints.maxWidth * 1; // 80% من عرض الشاشة
//           double containerHeight =
//               containerWidth * 0.33; // نسبة الطول إلى العرض
//           double imageSize =
//               containerHeight * 0.55; // حجم الصور كنسبة من الارتفاع

//           return GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => const Heart(),
//               //   ),
//               // );
//             },
//             child: Container(
//               // width: containerWidth,
//               // height: containerHeight,
//               height: MediaQuery.of(context).size.height * 0.18,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: kPrimaryLightColor,
//               ),
//               child: BlocConsumer<PresssureCheckCubit, PresssureCheckStates>(
//                 listener: (context, state) {
//                   // TODO: implement listener
//                 },
//                 builder: (context, state) {
//                   if (state is GetPressureDataSuccess) {
//                     heartlenght = (state.heart.length) - 1;
//                     print(state.heart[heartlenght!]);
//                     heartrate = state.heart[heartlenght!].toString();

//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                                 child: Row(
//                               children: [
//                                 const Text(
//                                   "النبص في الدقيقه",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   "$heartrate",
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             )),
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 SizedBox(
//                                   child: Image.asset(
//                                     alignment:
//                                         const AlignmentDirectional(10, 10),
//                                     'assets/heart.png',
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Center(
//                                 child: Row(
//                               children: [
//                                 Text(
//                                   "النبص في الدقيقه",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             )),
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       child: Image.asset(
//                                         'assets/pulse.png',
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 SizedBox(
//                                   child: Image.asset(
//                                     alignment:
//                                         const AlignmentDirectional(10, 10),
//                                     'assets/heart.png',
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TicksOfHeart extends StatelessWidget {
  TicksOfHeart({
    super.key,
  });
  int? heartlenght;
  String? heartrate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 1; // 80% من عرض الشاشة
        double containerHeight = containerWidth * 0.33; // نسبة الطول إلى العرض
        double imageSize =
            containerHeight * 0.55; // حجم الصور كنسبة من الارتفاع

        return Container(
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsManager.kPrimaryLightColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("النبض في الدقيقة",
                          style: TextStyles.font18BlackMedium),
                      verticalSpace(5),
                      Text(
                        "68",
                        style: TextStyles.font18BlackMedium,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pulse.png',
                        color: Colors.blue,
                      ),

                      Image.asset(
                        'assets/images/pulse.png',
                        color: Colors.blue,
                      ),
                      Image.asset(
                        'assets/images/pulse.png',
                        color: Colors.blue,
                      ),
                      Image.asset(
                        'assets/images/pulse.png',
                        color: Colors.blue,
                      ),

                      //  verticalSpace(10),
                      //   SizedBox(
                      //     width: imageSize,
                      //     height: imageSize,
                      //     child: Image.asset(
                      //       'assets/images/heart.png',
                      //       color: Colors.red,
                      //       alignment: AlignmentDirectional.center,
                      //     ),
                      //   ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
