import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fitnesspal_user/presentation/home/widgets/carousel_home_box.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

class CarouselSliderHomeWidget extends StatelessWidget {
  const CarouselSliderHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: [
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel1WP,
          onTap: () {
            url_launcher.launch(StringsManager.strengthUrl);
          },
          title: StringsManager.strengh,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel2WP,
          onTap: () {
            url_launcher.launch(StringsManager.yogaUrl);
          },
          title: StringsManager.yoga,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel3WP,
          onTap: () {
            url_launcher.launch(StringsManager.powerUrl);
          },
          title: StringsManager.power,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel4WP,
          onTap: () {
            url_launcher.launch(StringsManager.meditationUrl);
          },
          title: StringsManager.meditation,
        ),
        CarouselHomeBox(
          deviceWidth: deviceWidth,
          image: ImageManager.carousel5WP,
          onTap: () {
            url_launcher.launch(StringsManager.confidenceUrl);
          },
          title: StringsManager.confidence,
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
