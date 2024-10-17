import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:challenge/features/medicine/ui/widgets/medicine_app_bar.dart';
import 'package:challenge/features/medicine/ui/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicineCubit, MedicineState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:  FloatingActionButton(
            onPressed: () {
              context.pushNamed(Routers.addMedicine,);
            },
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MedicineAppBar(),
                verticalSpace(16),
                Text('اليوم', style: TextStyles.font18BlackMedium),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return MedicineCard(
                        medicine:
                            MedicineCubit.get(context).getMedicines[index],
                      );
                    },
                    itemCount: MedicineCubit.get(context).getMedicines.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
