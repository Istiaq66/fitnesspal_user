import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WorkoutIntermediate extends StatefulWidget {
  const WorkoutIntermediate({Key? key}) : super(key: key);

  @override
  State<WorkoutIntermediate> createState() => _WorkoutIntermediateState();
}

class _WorkoutIntermediateState extends State<WorkoutIntermediate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 53.0,
          color: Colors.black26,
          child: IconButton(
            padding: EdgeInsets.only(left: getWidth(context) * 0.05),
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.red,
              size: 27.0,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: getHeight(context) * 0.1,
                    left: getWidth(context) * 0.06),
                width: getWidth(context) * 0.2,
                height: getHeight(context) * 0.02,
                child: const Text(
                  'Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getWidth(context) * 0.4,
                      height: getHeight(context) * 0.025,
                      margin: EdgeInsets.only(left: getWidth(context) * 0.06),
                      child: const Text(
                        'INTERMEDIATE',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(),
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    width: getWidth(context),
                                    height: getHeight(context) * 0.70,
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
                                          const SizedBox(height: 9.0,),

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
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    child: const Text(
                                                  'Seated Abs',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                Container(
                                                    child: const Text(
                                                  'T-Plank',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                Container(
                                                    child: const Text(
                                                  'Split Jump',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )),
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
                              });
                        },
                        icon: const Icon(Icons.sports_gymnastics),
                        color: Colors.white,
                        iconSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter1()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_chest.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Chest Addict',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter2()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_back.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Back-Bieps',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter3()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_shoulder.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Shoulder Routine',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter4()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_triceps.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Triceps Routine',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter5()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_legs.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Legs Routine',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateinter6()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white10,
                      ),
                      height: getHeight(context) * 0.35,
                      width: getWidth(context) * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getHeight(context) * 0.3,
                            width: getWidth(context),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inter_legs1.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Legs Burner',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const animateinter7()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white10,
                  ),
                  height: getHeight(context) * 0.35,
                  width: getWidth(context) * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getHeight(context) * 0.3,
                        width: getWidth(context),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/inter_upperbody.jpg"),
                              scale: 1.0,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: getWidth(context) * 0.032),
                        child: const Text(
                          'Upper Body',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context) * 0.05,
              ),
            ],
          ),
        ));
  }
}

class animateinter1 extends StatefulWidget {
  const animateinter1({Key? key}) : super(key: key);

  @override
  State<animateinter1> createState() => _animateinter1State();
}

class _animateinter1State extends State<animateinter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_chest.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter2 extends StatefulWidget {
  const animateinter2({Key? key}) : super(key: key);

  @override
  State<animateinter2> createState() => _animateinter2State();
}

class _animateinter2State extends State<animateinter2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_back.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter3 extends StatefulWidget {
  const animateinter3({Key? key}) : super(key: key);

  @override
  State<animateinter3> createState() => _animateinter3State();
}

class _animateinter3State extends State<animateinter3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_shoulder.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter4 extends StatefulWidget {
  const animateinter4({Key? key}) : super(key: key);

  @override
  State<animateinter4> createState() => _animateinter4State();
}

class _animateinter4State extends State<animateinter4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_triceps.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter5 extends StatefulWidget {
  const animateinter5({Key? key}) : super(key: key);

  @override
  State<animateinter5> createState() => _animateinter5State();
}

class _animateinter5State extends State<animateinter5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_legs.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter6 extends StatefulWidget {
  const animateinter6({Key? key}) : super(key: key);

  @override
  State<animateinter6> createState() => _animateinter6State();
}

class _animateinter6State extends State<animateinter6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_legs1.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateinter7 extends StatefulWidget {
  const animateinter7({Key? key}) : super(key: key);

  @override
  State<animateinter7> createState() => _animateinter7State();
}

class _animateinter7State extends State<animateinter7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Container(
            child: const Image(
              image: AssetImage("assets/images/inter_upperbody.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
