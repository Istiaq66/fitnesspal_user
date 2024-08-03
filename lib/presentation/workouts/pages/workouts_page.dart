import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:fitnesspal_user/presentation/workouts/providers/workout_provider.dart';
import 'package:fitnesspal_user/presentation/workouts/widgets/new_exercise_button.dart';
import 'package:fitnesspal_user/presentation/workouts/widgets/exercise_widget.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Future<void> _handleRefresh() async {
    setState(() {
      Provider.of<WorkoutProvider>(context, listen: false)
          .fetchAndSetWorkouts();
    });
    return await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // DateTime now = DateTime.now();
    // DateTime startOfMonth = DateTime(now.year, now.month, 1);
    // DateTime startOfNextMonth = DateTime(now.year, now.month + 1, 1);
    // DateTime endOfMonth = startOfNextMonth.subtract(const Duration(days: 1));


    return Consumer<WorkoutProvider>(
      builder: (context, workoutsProvider, _) =>
          SafeArea(
        child: LiquidPullToRefresh(
          height: SizeManager.s250.h,
          color: ColorManager.darkGrey,
          animSpeedFactor: 2,
          backgroundColor: ColorManager.white2,
          onRefresh: _handleRefresh,
          child: FutureBuilder<void>(
            future: workoutsProvider.fetchAndSetWorkouts(),
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeatMap(
                        datasets: workoutsProvider.heatMapData,
                        colorMode: ColorMode.opacity,
                        startDate: DateTime.now().subtract(const Duration(days: 45)),
                        endDate:  DateTime.now().add(const Duration(days: 45)),
                        showText: false,
                        scrollable: true,
                        textColor: Colors.white,
                        colorsets: const {
                        1 : Color.fromARGB(20, 2, 179, 8),
                        2 : Color.fromARGB(40, 2, 179, 8),
                        3 : Color.fromARGB(60, 2, 179, 8),
                        4 : Color.fromARGB(80, 2, 179, 8),
                        5 : Color.fromARGB(100, 2, 179, 8),
                        6 : Color.fromARGB(120, 2, 179, 8),
                        7 : Color.fromARGB(150, 2, 179, 8),
                        8 : Color.fromARGB(180, 2, 179, 8),
                        9 : Color.fromARGB(220, 2, 179, 8),
                        10 : Color.fromARGB(255, 2, 179, 8),
                        },
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: NewExerciseButton(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.addNewExerciseRoute,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: workoutsProvider.workouts.length,
                          itemBuilder: (context, index) {
                            final workout = workoutsProvider.workouts[index];
                            final allWorkouts =
                                workoutsProvider.allWorkouts[index];
                            return ExerciseWidget(
                              name: workout.name,
                              repNumber: workout.repNumber,
                              setNumber: workout.setNumber,
                              id: workout.id,
                              onDeleted: (_) {
                                setState(
                                  () {
                                    workoutsProvider.deleteWorkout(
                                      workoutID: workout.id,
                                    );
                                    workoutsProvider.deleteAllWorkout(
                                      allWorkoutID: allWorkouts.id,
                                    );
                                  },
                                );
                              },
                              onFinished: (_) {
                                setState(
                                  () {
                                    workoutsProvider.finishWorkout(
                                      workoutID: workout.id,
                                      name: workout.name,
                                      repNumber: workout.repNumber,
                                      setNumber: workout.setNumber,
                                      dateTime: workout.dateTime,
                                    );
                                    workoutsProvider.deleteWorkout(
                                      workoutID: workout.id,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
