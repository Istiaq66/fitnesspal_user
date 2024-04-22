
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    route();
  }

  Future<void> route() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 5), () {
      user.authStateChanges().listen((event) {
        if (!sharedPreferences.containsKey('intro')) {
          sharedPreferences.setBool('intro', true);
          Navigator.of(context).pushReplacementNamed(
            Routes.boardingRoute,
          );
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.authRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.logo,
              width: size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}