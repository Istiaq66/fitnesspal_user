import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:flutter/material.dart';

class WorkoutTypeCards extends StatelessWidget {
  final void Function() onTap;
  final String image;
  final String workoutType;
  final int? voltCount;
  const WorkoutTypeCards({super.key,required this.onTap,required this.image,required this.workoutType,required this.voltCount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: getHeight(context)*0.2,
        width: getWidth(context)*0.93,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: getHeight(context)*0.02,left: getWidth(context)*0.03),
              child: Text(
                workoutType,
                style: const TextStyle(
                  letterSpacing: 0.5,
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(context)*0.09,left: getWidth(context)*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon( Icons.bolt, color: Colors.red,),
                  Icon( Icons.bolt, color: voltCount == 2 || voltCount == 3 ? Colors.red : Colors.white30,),
                  Icon( Icons.bolt, color: voltCount == 3 ? Colors.red : Colors.white30,),
                ],
              ),
            ),
          ],
        ),
      ),
      //chest beginner on tap
      onTap: ()=> onTap(),
    );
  }
}
