import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/medicine/data/model/get_medicine_response_model.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineCard extends StatelessWidget {
  final GetMedicineResponseBody medicine;
  const MedicineCard({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 5,
        shadowColor: ColorsManager.kPrimaryColor,
        color: ColorsManager.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${medicine.name}',
                    style: TextStyles.font18BlackBold,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        context
                            .read<MedicineCubit>()
                            .deleteMedicine(medicine.id!);
                      },
                      child: const Icon(Icons.delete))
                ],
              ),
              Row(
                children: [
                  Text('${medicine.dosage}',
                      style: TextStyles.font13Blackmedium),
                  horizontalSpace(5),
                  Text('${medicine.times}',
                      style: TextStyles.font13Blackmedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
