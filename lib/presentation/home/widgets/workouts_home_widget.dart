import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:fitnesspal_user/presentation/home/widgets/workout_advanced.dart';
import 'package:fitnesspal_user/presentation/home/widgets/workout_beginnner.dart';
import 'package:fitnesspal_user/presentation/home/widgets/workout_intermediate.dart';
import 'package:fitnesspal_user/presentation/home/widgets/workout_type_cards.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:flutter/material.dart';

import 'more_articles.dart';


class WorkOutsHomeWidget extends StatelessWidget {
  const WorkOutsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: PaddingManager.p20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Beginner Container
            WorkoutTypeCards(image: 'assets/images/calis1.jpg', workoutType: 'BEGINNER', voltCount: 1,
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const WorkoutBeginner())),
            ), const SizedBox(height: PaddingManager.p16,),

            ///Intermediate Container
            WorkoutTypeCards(image: 'assets/images/calis2.jpg', workoutType: 'INTERMEDIATE', voltCount: 2,
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorkoutIntermediate())),
            ), const SizedBox(height: PaddingManager.p16,),

            ///Advanced Container
            WorkoutTypeCards(image: 'assets/images/calis3.jpg', workoutType: 'ADVANCED', voltCount: 3,
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const WorkoutAdvance())),
            ), const SizedBox(height: PaddingManager.p16,),

            Container(
              width: getWidth(context),
              margin: EdgeInsets.only(left: getWidth(context)*0.08,top: getHeight(context)*0.02),
              child: const Text('HEALTHY LIFESTYLE', style: TextStyle(color: Colors.white60, fontSize: 10.0,),),
            ),
            Row(
              children: [
                Container(
                  width: getWidth(context)*0.6,
                  margin: EdgeInsets.only(left: getWidth(context)*0.08,),
                  child: const Text('HEALTHY ARTICLES', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold,),),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(right: getWidth(context)*0.05),
                  child: TextButton(
                    child: const Text(
                      'see all',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const morearticles()));
                    },
                  ),
                ),


              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                      width: getWidth(context)*0.9,
                      height: getHeight(context)*0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: getWidth(context)*0.05,right: getWidth(context)*0.02),
                      child: SizedBox(
                        width: getWidth(context)*0.8,
                        height: getHeight(context)*0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center
                              , crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getWidth(context)*0.6,
                                  child: const Text(
                                    'Top Vegetables That Are High In protein',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context)*0.23,
                                  height: getHeight(context)*0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/vegg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(

                      width: getWidth(context)*0.9,
                      height: getHeight(context)*0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: getWidth(context)*0.02,right: getWidth(context)*0.02),
                      child: SizedBox(
                        width: getWidth(context)*0.8,
                        height: getHeight(context)*0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.center
                              , crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                SizedBox(

                                  width: getWidth(context)*0.6,

                                  child: const Text(
                                    'Reasons Why Sugar Is Bad For You',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context)*0.23,
                                  height: getHeight(context)*0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/nosugar.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(

                      width: getWidth(context)*0.9,
                      height: getHeight(context)*0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: getWidth(context)*0.02,right: getWidth(context)*0.02),
                      child: SizedBox(
                        width: getWidth(context)*0.8,
                        height: getHeight(context)*0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.center
                              , crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                SizedBox(

                                  width: getWidth(context)*0.6,

                                  child: const Text(
                                    'The Benefits Of jumping Rope Training ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context)*0.23,
                                  height: getHeight(context)*0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/rope.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(

                      width: getWidth(context)*0.9,
                      height: getHeight(context)*0.13,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: getWidth(context)*0.02,right: getWidth(context)*0.02),
                      child: SizedBox(
                        width: getWidth(context)*0.8,
                        height: getHeight(context)*0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.center
                              , crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                SizedBox(

                                  width: getWidth(context)*0.6,

                                  child: const Text(
                                    '6 Reasons For Doing Calisthenics Workouts  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                Container(
                                  width: getWidth(context)*0.23,
                                  height: getHeight(context)*0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage("assets/images/street.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),

            ///Nutrition portion
            Container(
              width: getWidth(context),
              margin: EdgeInsets.only(left: getWidth(context)*0.08,top: getHeight(context)*0.02),
              child: const Text(
                'HEALTHY FOOD',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 10.0,
                ),
              ),
            ),

            Row(
              children: [
                Container(
                  width: getWidth(context)*0.6,
                  margin: EdgeInsets.only(left: getWidth(context)*0.08,),
                  child:
                  const Text(
                    'NUTRITION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(right: getWidth(context)*0.05,),
                  child: TextButton(
                    child:
                    const Text(
                      'see all',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),

                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>morenutrition()));
                    },
                  ),
                ),

              ],
            ),
            SingleChildScrollView(
              // padding: EdgeInsets.symmetric(horizontal: 33),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                      width: getWidth(context)*0.9,
                      height: getHeight(context)*0.38,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: getWidth(context)*0.05,right: getWidth(context)*0.02,bottom: 20),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0,left: getWidth(context)*0.02,right: getWidth(context)*0.02),
                                height: getHeight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: const DecorationImage(
                                      image: AssetImage ("assets/images/fishy.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: getWidth(context)*0.045,top: getWidth(context)*0.03),
                              child: const Text(
                                'Fish',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: getWidth(context)*0.045,top: getWidth(context)*0.03),
                                child: const Text(
                                  'Fish is filled with omega-3 fatty acids and vitamins such as D and B2 (riboflavin). Fish is rich in calcium and phosphorus and a great source of minerals, such as iron, zinc, iodine, magnesium, and potassium.',
                                  style: TextStyle(
                                    color: Colors.white70,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
