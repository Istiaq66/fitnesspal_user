import 'package:fitnesspal_user/presentation/workouts/providers/workout_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white2,
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
          "Step Counter",style: TextStyle(color: ColorManager.white,),
        ),
      ),
      body: Consumer<WorkoutProvider>(builder: (context,workoutProvider,_) {
        return Center(
          child: Column(
            children: [
              SfRadialGauge(
                  title: const GaugeTitle(
                      text: 'Speedometer',
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
                      NeedlePointer(value: double.tryParse(workoutProvider.steps) ?? 0)
                    ], annotations:   <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(workoutProvider.steps,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(workoutProvider.steps),
              ElevatedButton(
                child: const Text('Press'),
                onPressed: () {
                  workoutProvider.initPlatformState(mounted);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}