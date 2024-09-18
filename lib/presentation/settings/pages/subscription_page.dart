import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitnesspal_user/presentation/settings/widgets/subscription_card.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.darkGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeManager.s20.h,),
            Text(StringsManager.subscriptionPackages, style: StyleManager.homePageTextSpacerTextStyle,),
            SizedBox(height: SizeManager.s20.h,),

          SubscriptionCard(color: Colors.purpleAccent,name:'Basic',time:'1 month',money: '1000tk',),
          SubscriptionCard(color: Colors.pinkAccent,name:'Standard',time:'6 month',money: '1500tk',),
          SubscriptionCard(color: Colors.deepOrangeAccent,name:'Premium',time:'1 year',money: '2000tk',),
        ],),
      ),
    );
  }
}
