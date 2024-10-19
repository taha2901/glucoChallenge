import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/health_measurment_buttons.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/part_screen_pressure.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/part_screen_suger.dart';
import 'package:challenge/features/measurments/ui/widgets/add_measurments/part_screen_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MeasurementType { sugar, weight, pressure }

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  State<MeasurementsScreen> createState() => _MyAppState();
}

class _MyAppState extends State<MeasurementsScreen> {
  MeasurementType selectedMeasurement = MeasurementType.sugar;

  List<Widget> measurementScreens = [
    const PartScreenSuger("mg/dl", "قياس السكر"),
    PartScreenWeight(unitText: "Kg", hintText: "قياس الوزن"),
    const PartScreenPressure(
        "mmHg", "mmHg", "bpm", "الانقباض", "الانبساط", "معدل ضربات القلب"),
  ];

  Color _getColor(MeasurementType type) {
    return selectedMeasurement == type ? Colors.blue : Colors.grey;
  }

  String _getTitle() {
    switch (selectedMeasurement) {
      case MeasurementType.pressure:
        return "قياس الضغط";
      case MeasurementType.weight:
        return "الوزن";
      case MeasurementType.sugar:
      default:
        return "قياس السكر";
    }
  }

  void _onMeasurementSelected(MeasurementType type) {
    setState(() {
      selectedMeasurement = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeasurmentsCubit, MeasurmentsState>(
      listener: (context, state) {
        state.maybeWhen(
          addBloodSugerError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('حدث خطأ أثناء حفظ السكر.')),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(_getTitle()),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: verticalSpace(32)),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HealthMeasurementButton(
                        imagePath:
                            'assets/images/healthicons_blood-pressure-2-outline.png',
                        label: "قياس الضغط",
                        color: _getColor(MeasurementType.pressure),
                        onTap: () =>
                            _onMeasurementSelected(MeasurementType.pressure),
                      ),
                      HealthMeasurementButton(
                        imagePath: 'assets/images/icon-park-outline_weight.png',
                        label: "وزن",
                        color: _getColor(MeasurementType.weight),
                        onTap: () =>
                            _onMeasurementSelected(MeasurementType.weight),
                      ),
                      HealthMeasurementButton(
                        imagePath: 'assets/images/lets-icons_blood.png',
                        label: "قياس السكر",
                        color: _getColor(MeasurementType.sugar),
                        onTap: () =>
                            _onMeasurementSelected(MeasurementType.sugar),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: measurementScreens[selectedMeasurement.index],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
