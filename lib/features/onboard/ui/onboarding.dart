import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/features/login/ui/login_screen.dart';
import 'package:challenge/features/onboard/data/onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

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
  bool islast = false;

  // Future<void> submit() async {
  //   saveUserToken(true); // Await the saveUserToken function
  //   // Navigator.pushAndRemoveUntil(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => ),
  //   //   (route) => false,
  //   // );
  //   context.pushNamedAndRemoveUntil(Routers.login, predicate: (route) => false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  setState(() {
                    islast = index == board.length - 1;
                  });
                },
                itemBuilder: (context, index) {
                  return BuildBoardingItem(board: board[index]);
                },
                itemCount: board.length,
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    // onPressed: submit,
                    onPressed: () {},
                    child: const Text('تخطي'),
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: board.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (islast) {
                        context.pushNamedAndRemoveUntil(Routers.login,
                            predicate: (route) => false);
                      } else {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2.3, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key, required this.board});

  final OnBoardingModel board;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                  image: AssetImage(board.image),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(
              board.body,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

void saveUserToken(bool onboard) async {
  await SharedPrefHelper.setData(SharedPrefKeys.onboard, onboard);
}
