import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitnesspal_user/presentation/settings/widgets/subscription_card.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final fireStore = FirebaseFirestore.instance;
  late ConfettiController _controllerCenter;

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
  }


  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.darkGrey,
        body: Stack(
          children: [
            //CENTER -- Blast
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                true, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
                createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeManager.s20.h,),
                Text(StringsManager.subscriptionPackages, style: StyleManager.homePageTextSpacerTextStyle,),
                SizedBox(height: SizeManager.s20.h,),
                Expanded(
                  child: StreamBuilder(
                    stream: fireStore.collection('Packages').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;

                        // Check if there are no documents
                        if (documents.isEmpty) {
                          return const Center(
                            child: Text('No Package available.'),
                          );
                        }

                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final data = documents[index].data() as Map<String, dynamic>;

                            return SubscriptionCard(
                              name: data['Name'].toString(),
                              money: data['Amount'].toString(),
                              time: data['Duration'].toString(),
                              color: index % 2 == 0 ? Colors.pinkAccent : Colors.deepOrangeAccent,
                              func: () => {
                                Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: "Buy package",
                                  desc:
                                  "Are you sure you want to buy this package?",
                                  buttons: [
                                    DialogButton(
                                      onPressed: () {
                                        _controllerCenter.play();
                                        Future.delayed(const Duration(seconds: 5)).then((_){
                                          setState(() {
                                            _controllerCenter.stop();
                                          });
                                        });
                                        Navigator.pop(context);
                                      },
                                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                                      child: const Text("Buy", style: TextStyle(color: Colors.white, fontSize: 20),),
                                    ),
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      color: Colors.red,
                                      child: const Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 20),),
                                    )
                                  ],
                                ).show(),
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
            ],),
          ],
        ),
      ),
    );
  }
}
