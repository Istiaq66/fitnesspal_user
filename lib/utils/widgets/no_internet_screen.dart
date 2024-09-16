
import 'package:fitnesspal_user/presentation/splash/pages/splash_screen.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:flutter/material.dart';


class NoInternetScreen extends StatelessWidget {
  final Widget? child;
  const NoInternetScreen({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageManager.noInternet, width: 300, height: 300),
            Text('Oops! No internet', style: StyleManager.abTitleTextStyle, ),
            const SizedBox(height: PaddingManager.p4),
            Text(
              'No internet connection', textAlign: TextAlign.center, style: StyleManager.homePageS20BoldDarkGrey,
            ),
            const SizedBox(height: 40),

            GestureDetector(
              onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                  );
                  return;
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: Center(child: Icon(Icons.refresh, size: 34, color: Theme.of(context).cardColor)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
