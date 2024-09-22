import 'package:fitnesspal_user/presentation/workouts/providers/workout_provider.dart';
import 'package:fitnesspal_user/presentation/workouts/widgets/step_status_widget.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepCounterPage extends StatefulWidget {
  const StepCounterPage({super.key});

  @override
  State<StepCounterPage> createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    await Provider.of<WorkoutProvider>(context, listen: false).initPlatformState(mounted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: ColorManager.grey3,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: SizeManager.s20,
            color: ColorManager.white,
          ),
        ),
        backgroundColor: ColorManager.darkGrey,
        centerTitle: true,
        title: const Text(
          "Step Counter",
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),
      body: Consumer<WorkoutProvider>(builder: (context, workoutProvider, _) {
        return SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Expanded(
                    child: Padding(padding: const EdgeInsets.all(10),
                      child: StepStatusWidget(color: ColorManager.limeGreen,
                          mainTitle: 'Total calorie burned', number: workoutProvider.caloriesBurned.toString(),
                          iconData: Icons.local_fire_department
                       ),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: const EdgeInsets.all(10),
                      child: StepStatusWidget(color: ColorManager.limeGreen,
                        mainTitle: workoutProvider.status,number: workoutProvider.steps.toString(),
                        iconData: workoutProvider.status == 'walking'
                            ? Icons.directions_walk
                            : workoutProvider.status == 'stopped'
                            ? Icons.accessibility_new
                            : Icons.error,),
                    ),
                  ),
                ],
              ),  const SizedBox(height: 30),

              SfRadialGauge(
                  title: const GaugeTitle(text: 'Total steps today', textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 2000, pointers: <RangePointer>[
                      RangePointer(
                        value: double.tryParse(workoutProvider.steps.toString()) ?? 0,
                        color: ColorManager.limeGreen,
                      )
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget:
                              Text(workoutProvider.steps.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]),
            ],
          ),
        );
      }),
    );
  }
}
