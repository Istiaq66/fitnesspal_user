
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';

class SubscriptionCard extends StatelessWidget {
  Color? color;
  String? time;
  String? money;
  String? name;
  SubscriptionCard({this.color,this.time,this.money,this.name,super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p28),
          child:
              Container( height:size.height * 0.2, width: double.infinity,
                  decoration: BoxDecoration(
                    color: color,
                      borderRadius: const BorderRadius.all(Radius.circular(RadiusManager.r15))
                  ),
                  child: Column( mainAxisAlignment: MainAxisAlignment.center,children: [
                   Text('$name',style: StyleManager.percentValueOfMealTextStyle,),
                    SizedBox(height: SizeManager.s10.h,),

                   Text('$money',style: StyleManager.settingsOptionTiteTextStyle,),
                    SizedBox(height: SizeManager.s10.h,),

                   Text('$time',style: StyleManager.percentValueOfMealTextStyle,),
                ],
              )),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 5,
          child: Container( width: 60, height: 60,
            decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle
            ),
            child: const Icon( Icons.chevron_right, size: SizeManager.s35, color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
