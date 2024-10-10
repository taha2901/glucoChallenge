import 'package:bloc/bloc.dart';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/features/onboard/data/onboard.dart';
import 'package:challenge/features/onboard/logic/cubit/onboard_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class OnboardCubit extends Cubit<OnboardState> {
  // OnboardCubit() : super(const OnboardState.initial());
  

  final List<OnBoardingModel> board = [
    OnBoardingModel(
        body:
            'اعثر على أفضل الأطباء في منطقتك واحجز موعدًا بكل سهولة للحصول على الرعاية الصحية الممتازة التي تستحقها.',
        image: 'assets/images/1.png'),
    OnBoardingModel(
        body: 'استمتع بمتابعه مستوي السكر المناسب لعيشه حياه طبيعيه ',
        image: 'assets/images/2.png'),
    OnBoardingModel(
        body:
            'الاهتمام بالرياضه هتفيدك و تظبط مستوي السكر تابع مع مستويات الرياضه و اوصل للهدف الي يظبط مستوي السكر ',
        image: 'assets/images/3.png'),
  ];

  OnboardCubit(super.initialState);

  void onBaord() {
    SharedPrefHelper.setData(SharedPrefKeys.onboard, 'true').then((value) {
      if (value) {
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoginScreen(),
        //   ),
        //   (route) => false,
        // );
      }
    });
  }
}
