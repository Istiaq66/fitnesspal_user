import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WarmupBottomSheet extends StatelessWidget {
  const WarmupBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        width: getWidth(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15, top: 10),
                    width: getWidth(context) * 0.4,
                    height:
                    getHeight(context) * 0.05,
                    child: const Center(
                      child: Text(
                        'Quick Warmup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: getWidth(context),
                height: 1.5,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0),
                child: const Text(
                  'Warm up properly before exercising to prevent injury ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 2.0),
                child: const Text(
                  'and make your workouts more effective.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0,
                    bottom: 25.0),
                child: const Text(
                  'Repeat each exercise for 20 seconds',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 8.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                      child: Lottie.asset(
                        'assets/animations/pushups.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                    Container(
                      child: Lottie.asset(
                        'assets/animations/jumping_jack.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                    Container(
                      child: Lottie.asset(
                        'assets/animations/squats.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                        child: const Text(
                          'Pushups',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        child: const Text(
                          'Jumping Jack',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    Container(
                      child: const Text(
                        'Squat Kick',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                      child: Lottie.asset(
                        'assets/animations/abs.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                    Container(
                      child: Lottie.asset(
                        'assets/animations/t_plank.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                    Container(
                      child: Lottie.asset(
                        'assets/animations/split_jump.json',
                        fit: BoxFit.cover,
                        height: getHeight(context) *
                            0.08,
                        frameRate: FrameRate(60),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) * 0.05,
                    right: getWidth(context) * 0.05,
                    top: 10.0),
                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text(
                      'Seated Abs',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'T-Plank',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Split Jump',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              InkWell(
                child: Container(
                  width: getWidth(context),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  margin: EdgeInsets.only(
                      top: 25.0,
                      left:
                      getWidth(context) * 0.05,
                      right:
                      getWidth(context) * 0.05,
                      bottom: 20.0),
                  child: const Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
