import 'package:fitnesspal_user/presentation/consumption/providers/consumption_provider.dart';
import 'package:fitnesspal_user/presentation/home/widgets/carousel_slider_home_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/fitness_data_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/home_page_text_spacer_widget.dart';
import 'package:fitnesspal_user/presentation/home/widgets/todays_progress_widget.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConsumptionProvider>(context, listen: false).fetchAndSetMeals();
    Provider.of<ConsumptionProvider>(context, listen: false).fetchAndSetWater();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TodaysProgressWidget(),
            HomePageTextSpacerWidget(
              title: StringsManager.todaysAct,
            ),
            FitnessDataWidget(),
            HomePageTextSpacerWidget(
              title: StringsManager.explore,
            ),
            CarouselSliderHomeWidget()
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: 500.ms,
        );
  }
}
