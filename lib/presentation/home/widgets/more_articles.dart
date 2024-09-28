
import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:fitnesspal_user/presentation/home/pages/home_page.dart';

import 'ArticleAlmonds.dart';
import 'Article_Eggs.dart';
import 'package:flutter/material.dart';

class morearticles extends StatefulWidget {
  const morearticles({Key? key}) : super(key: key);

  @override
  State<morearticles> createState() => _morearticlesState();
}

class _morearticlesState extends State<morearticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 53.0,
          color: Colors.black26,
          child: IconButton(
            padding: const EdgeInsets.only(left: 30.0),
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
        body: Container(
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: getWidth(context) * 0.08,
                              top: getHeight(context) * 0.05),
                          child: const Text(
                            'Articles',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Container(
                        // margin: EdgeInsets.only(top: getHeight(context)*0.05,left: getWidth(context)*0.55),
                        // child: IconButton(
                        // onPressed: (){},
                        // icon: Icon(Icons.),
                        // color: Colors.white,
                        // ),
                        // ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const articleeggs()));
                    },
                    child: Container(
                        width: getWidth(context) * 0.9,
                        height: getHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(
                            top: getHeight(context) * 0.025,
                            left: getWidth(context) * 0.05,
                            right: getWidth(context) * 0.02),
                        child: SizedBox(
                          width: getWidth(context) * 0.8,
                          height: getHeight(context) * 0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: getWidth(context) * 0.6,
                                    child: const Text(
                                      'What is Special about Eggs?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: getWidth(context) * 0.23,
                                    height: getHeight(context) * 0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/eggs.jpg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                    child: Container(
                        width: getWidth(context) * 0.9,
                        height: getHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(
                            left: getWidth(context) * 0.05,
                            right: getWidth(context) * 0.02),
                        child: SizedBox(
                          width: getWidth(context) * 0.8,
                          height: getHeight(context) * 0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: getWidth(context) * 0.6,
                                    child: const Text(
                                      'What is Special about Almonds?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: getWidth(context) * 0.23,
                                    height: getHeight(context) * 0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/almonds.jpg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const articlealmonds()));
                    },
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'Which Cardio Machine is Best?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image:
                                          AssetImage("assets/images/m.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    '6 Reasons Cycling is Good for Health',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/cyc.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'The Best Post-Workouts Snacks',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/snaks.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'Best Tips for fat Loss',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image:
                                          AssetImage("assets/images/f.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'Health benefits of Swimming',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image:
                                          AssetImage("assets/images/s.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'Hydration Mistakes You Are Making During Exercise',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/hydr.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                      width: getWidth(context) * 0.9,
                      height: getHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: getWidth(context) * 0.05,
                          right: getWidth(context) * 0.02),
                      child: SizedBox(
                        width: getWidth(context) * 0.8,
                        height: getHeight(context) * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context) * 0.6,
                                  child: const Text(
                                    'Should You Get a Personal Trainer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context) * 0.23,
                                  height: getHeight(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/train.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )));
  }
}
