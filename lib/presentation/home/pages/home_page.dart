
import 'package:fitnesspal_user/presentation/consumption/providers/consumption_provider.dart';
import 'package:fitnesspal_user/presentation/home/providers/home_provider.dart';
import 'package:fitnesspal_user/presentation/home/widgets/carousel_slider_home_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/fitness_data_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/home_page_text_spacer_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/todays_progress_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/workouts_home_widget.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    Provider.of<ConsumptionProvider>(context, listen: false).fetchAndSetMeals();
    Provider.of<ConsumptionProvider>(context, listen: false).fetchAndSetWater();
    scrollController?.addListener(() {
      if (scrollController?.position.userScrollDirection == ScrollDirection.reverse) {
        if (Provider.of<HomeProvider>(context, listen: false).isVisible) {
          Provider.of<HomeProvider>(context, listen: false).setVisibility();
          Future.delayed(const Duration(microseconds: 800), ()=> Provider.of<HomeProvider>(context, listen: false).setVisibility());
        }
      }else{
        if (Provider.of<HomeProvider>(context, listen: false).isVisible) {
          Provider.of<HomeProvider>(context, listen: false).setVisibility();
          Future.delayed(const Duration(microseconds: 800), ()=> Provider.of<HomeProvider>(context, listen: false).setVisibility());
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Consumer<HomeProvider>(
        builder: (context,homeProvider,_) {
          return Scaffold(
            backgroundColor: ColorManager.darkGrey,
            floatingActionButton: homeProvider.isVisible ? InkWell( customBorder: const CircleBorder(),
              child: Image.asset(ImageManager.chatBot,height: 50,),
                onTap: () => Navigator.of(context).pushNamed(Routes.chatBot),
            ) : const SizedBox(),
            body: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomePageTextSpacerWidget(
                    title: StringsManager.explore,
                  ),
                  CarouselSliderHomeWidget(),
                  TodaysProgressWidget(),
                  HomePageTextSpacerWidget(
                    title: StringsManager.todaysAct,
                  ),
                  FitnessDataWidget(),

                  WorkOutsHomeWidget(),
                ],
              ),
            ),
          );
        }
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
