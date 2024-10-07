import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:fitnesspal_user/presentation/home/widgets/warmup_bottom_sheet.dart';
import 'package:flutter/material.dart';

class WorkoutAdvance extends StatefulWidget {
  const WorkoutAdvance({Key? key}) : super(key: key);

  @override
  State<WorkoutAdvance> createState() => _WorkoutAdvanceState();
}

class _WorkoutAdvanceState extends State<WorkoutAdvance> {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: getHeight(context) * 0.1, left: getWidth(context) * 0.06),
                  width: getWidth(context) * 0.2,
                  height: getHeight(context) * 0.02,
                  child: const Text(
                    'Level',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )),
              SizedBox(width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(context) * 0.035,
                      margin: EdgeInsets.only(left: getWidth(context) * 0.06),
                      child: const Text('ADVANCED',
                        style: TextStyle(letterSpacing: 0.5, color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold,),
                      ),),
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
                                  const animateadvance1()));
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
                                      "assets/images/ad_pushups.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Advance Pushups',
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
                                  const animateadvance2()));
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
                                      "assets/images/ad_strength.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Advance Strength',
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
                                  const animateadvance3()));
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
                                  image:
                                      AssetImage("assets/images/ad_arms.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Arms Routine',
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
                                  const animateadvance4()));
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
                                  image:
                                      AssetImage("assets/images/ad_back.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Back Routine',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const animateadvance5()));
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
                                  image:
                                      AssetImage("assets/images/ad_full.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(top: getWidth(context) * 0.032),
                            child: const Text(
                              'Full Body Routine',
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
            ],
          ),
        ));
  }
}

class animateadvance1 extends StatefulWidget {
  const animateadvance1({Key? key}) : super(key: key);

  @override
  State<animateadvance1> createState() => _animateadvance1State();
}

class _animateadvance1State extends State<animateadvance1> {
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
              image: AssetImage("assets/images/ad_pushups.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateadvance2 extends StatefulWidget {
  const animateadvance2({Key? key}) : super(key: key);

  @override
  State<animateadvance2> createState() => _animateadvance2State();
}

class _animateadvance2State extends State<animateadvance2> {
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
              image: AssetImage("assets/images/ad_strength.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateadvance3 extends StatefulWidget {
  const animateadvance3({Key? key}) : super(key: key);

  @override
  State<animateadvance3> createState() => _animateadvance3State();
}

class _animateadvance3State extends State<animateadvance3> {
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
              image: AssetImage("assets/images/ad_arms.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateadvance4 extends StatefulWidget {
  const animateadvance4({Key? key}) : super(key: key);

  @override
  State<animateadvance4> createState() => _animateadvance4State();
}

class _animateadvance4State extends State<animateadvance4> {
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
              image: AssetImage("assets/images/ad_back.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class animateadvance5 extends StatefulWidget {
  const animateadvance5({Key? key}) : super(key: key);

  @override
  State<animateadvance5> createState() => _animateadvance5State();
}

class _animateadvance5State extends State<animateadvance5> {
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
              image: AssetImage("assets/images/ad_full.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
