import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/measurments/data/model/add_measurments_models/blood_pressure_response_model.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TicksOfHeart extends StatelessWidget {
  const TicksOfHeart({super.key, this.bloodPressure});
  final BloodPressureData? bloodPressure;

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
              BlocBuilder<PressureCubit, PressureState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("النبض في الدقيقة",
                              style: TextStyles.font18BlackMedium),
                          horizontalSpace(5),
                          state is GetBloodPressureLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  '${state is GetBloodPressureSuccess ? state.heartRate : '0'}',
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
                          Image.asset(
                            'assets/images/pulse.png',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
