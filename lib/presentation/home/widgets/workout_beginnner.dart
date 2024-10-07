import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:fitnesspal_user/presentation/home/widgets/warmup_bottom_sheet.dart';
import 'package:flutter/material.dart';

class WorkoutBeginner extends StatefulWidget {
  const WorkoutBeginner({Key? key}) : super(key: key);

  @override
  State<WorkoutBeginner> createState() => _WorkoutBeginnerState();
}

class _WorkoutBeginnerState extends State<WorkoutBeginner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
                  )),
              SizedBox(
                width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(context) * 0.035,
                      margin: EdgeInsets.only(left: getWidth(context) * 0.06),
                      child: const Text(
                        'BEGINNER',
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
                                return const WarmupBottomSheet();
                              });
                        },
                        icon: const Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white,
                        ),
                        focusColor: Colors.red,
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
                                  const animatebeginner1()));
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
                                      "assets/images/beginner_basic.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Basic Beginner',
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
                                  const animatebeginner2()));
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
                                      "assets/images/beginner_back.jpg"),
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
                                  const animatebeginner3()));
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
                                      "assets/images/beginner_shoulder.jpg"),
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
                                  const animatebeginner4()));
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
                                      "assets/images/beginner_chest.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Chest Routine',
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
                                  const animatebeginner5()));
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
                                      "assets/images/beginner_fullbody.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Full Body',
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
                                  const animatebeginner6()));
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
                                      "assets/images/beginner_mix.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Beginner-Mix',
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
                                  const animatebeginner7()));
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
                                      "assets/images/beginner_triceps.jpg"),
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
                  SizedBox(
                    width: getWidth(context) * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animatebeginner8()));
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
                                      "assets/images/beginner_legs.jpg"),
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
                ],
              ),
            ],
          ),
        ));
  }
}

class animatebeginner1 extends StatefulWidget {
  const animatebeginner1({Key? key}) : super(key: key);

  @override
  State<animatebeginner1> createState() => _animatebeginner1State();
}

class _animatebeginner1State extends State<animatebeginner1> {
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
              image: AssetImage("assets/images/beginner_basic.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner2 extends StatefulWidget {
  const animatebeginner2({Key? key}) : super(key: key);

  @override
  State<animatebeginner2> createState() => _animatebeginner2State();
}

class _animatebeginner2State extends State<animatebeginner2> {
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
              image: AssetImage("assets/images/beginner_back.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner3 extends StatefulWidget {
  const animatebeginner3({Key? key}) : super(key: key);

  @override
  State<animatebeginner3> createState() => _animatebeginner3State();
}

class _animatebeginner3State extends State<animatebeginner3> {
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
              image: AssetImage("assets/images/beginner_shoulder.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner4 extends StatefulWidget {
  const animatebeginner4({Key? key}) : super(key: key);

  @override
  State<animatebeginner4> createState() => _animatebeginner4State();
}

class _animatebeginner4State extends State<animatebeginner4> {
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
              image: AssetImage("assets/images/beginner_chest.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner5 extends StatefulWidget {
  const animatebeginner5({Key? key}) : super(key: key);

  @override
  State<animatebeginner5> createState() => _animatebeginner5State();
}

class _animatebeginner5State extends State<animatebeginner5> {
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
              image: AssetImage("assets/images/beginner_fullbody.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner6 extends StatefulWidget {
  const animatebeginner6({Key? key}) : super(key: key);

  @override
  State<animatebeginner6> createState() => _animatebeginner6State();
}

class _animatebeginner6State extends State<animatebeginner6> {
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
              image: AssetImage("assets/images/beginner_mix.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner7 extends StatefulWidget {
  const animatebeginner7({Key? key}) : super(key: key);

  @override
  State<animatebeginner7> createState() => _animatebeginner7State();
}

class _animatebeginner7State extends State<animatebeginner7> {
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
              image: AssetImage("assets/images/beginner_triceps.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animatebeginner8 extends StatefulWidget {
  const animatebeginner8({Key? key}) : super(key: key);

  @override
  State<animatebeginner8> createState() => _animatebeginner8State();
}

class _animatebeginner8State extends State<animatebeginner8> {
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
              image: AssetImage("assets/images/beginner_legs.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
