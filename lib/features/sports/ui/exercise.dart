import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/features/sports/logic/exercise_cubit.dart';
import 'package:challenge/features/sports/logic/exercise_state.dart';
import 'package:challenge/features/sports/ui/widgets/app_bar_exercise.dart';
import 'package:challenge/features/sports/ui/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfExcercise(),
            Expanded(
              child: BlocProvider(
                create: (context) =>  getit<ExerciseCubit>()..getExercise(),
                child: BlocConsumer<ExerciseCubit, ExerciseState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: ExerciseCubit.get(context).exercises.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExerciseCard(
                            exercise:
                                ExerciseCubit.get(context).exercises[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
