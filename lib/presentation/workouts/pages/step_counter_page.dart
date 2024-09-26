import 'package:fitnesspal_user/presentation/workouts/providers/workout_provider.dart';
import 'package:fitnesspal_user/presentation/workouts/widgets/step_status_widget.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
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
    Provider.of<WorkoutProvider>(context, listen: false).calculateCalories();
    Provider.of<WorkoutProvider>(context, listen: false).calculateDistance();
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
                          iconData: Icons.local_fire_department,unit: 'Kcal',
                       ),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: const EdgeInsets.all(10),
                      child: StepStatusWidget(color: ColorManager.limeGreen,
                        mainTitle: workoutProvider.status,number: workoutProvider.prefs.getInt(StringsManager.savedTodayStepCount).toString(),
                        iconData: workoutProvider.status == 'walking'
                            ? Icons.directions_walk
                            : workoutProvider.status == 'stopped'
                            ? Icons.accessibility_new
                            : Icons.error,),
                    ),
                  ),
                ],
              ),  const SizedBox(height: 30),

            ///---Step---///
            SizedBox(height: 300, width: 300,
              child: SfRadialGauge(
              title: const GaugeTitle(
                text: 'Total todayStepCount today',
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: 2000,  // Maximum distance (e.g., 10 km)
                  startAngle: 0,  // Start of the circle (0°)
                  endAngle: 360,  // End of the circle (360° for full circular gauge)
                  showLabels: false,  // Hide axis labels if not needed
                  showTicks: false,   // Hide ticks if not needed
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: workoutProvider.todayStepCount.toDouble(),  // Distance covered value
                      width: 10,
                      color: Colors.blue,  // Single color for the entire gauge
                      cornerStyle: CornerStyle.bothCurve,  // Rounded pointer edges for a smooth look
                    ),
                    WidgetPointer(
                      value: workoutProvider.todayStepCount.toDouble(),  // Same value for user image pointer
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(ImageManager.exerciseLogo),  // User image as pointer
                        radius: 15,  // Adjust avatar size
                      ),
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        '${workoutProvider.todayStepCount}/2000',
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      angle: 90,
                      positionFactor: 0.5,  // Positioning inside the gauge
                    ),
                  ],
                ),
              ],),
            ),
            const SizedBox(height: 10,),

            ///---Distance---///
            SizedBox(height: 300, width: 300,
              child: SfRadialGauge(
                  title: const GaugeTitle(
                      text: 'Distance Covered',
                      textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 50,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 50,
                          endValue: 100,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers:  <GaugePointer>[
                      NeedlePointer(value: workoutProvider.distanceKm.toDouble())
                    ], annotations:   <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('${workoutProvider.distanceKm.toStringAsFixed(2)} km',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]),
            ),
          ]),
        );
      }),
    );
  }
}
