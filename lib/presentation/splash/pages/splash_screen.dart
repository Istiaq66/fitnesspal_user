import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';
import 'package:fitnesspal_user/utils/widgets/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late SharedPreferences sharedPreferences;
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool isNotConnected = false;
  bool isConnectivityChecked = false;

  @override
  void initState() {
    super.initState();

    // Check connectivity status immediately on start
    _checkInitialConnectivity();

    // Listen for connectivity changes
    _onConnectivityChanged = _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool previouslyNotConnected = isNotConnected;
      isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;

      if (isNotConnected != previouslyNotConnected) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: const Duration(seconds: 3),
          content: Text(
            isNotConnected ? 'No connection' : 'Connected',
            textAlign: TextAlign.center,
          ),
        ));

        if (!isNotConnected && isConnectivityChecked) {
          route(context);
        }
      }
    });
  }

  Future<void> _checkInitialConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isNotConnected = connectivityResult != ConnectivityResult.wifi &&
        connectivityResult != ConnectivityResult.mobile;

    // Set the connectivity check flag to true
    isConnectivityChecked = true;

    // After checking connectivity, call route
    if (mounted) {
      route(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  Future<void> route(BuildContext context) async {
    if (!isConnectivityChecked) {
      // Ensure connectivity is checked before proceeding
      return;
    }

    if (isNotConnected) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoInternetScreen()),
      );
      return;
    }

    sharedPreferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 5)); // Splash screen delay

    auth.authStateChanges().listen((User? user) async {
      if (!sharedPreferences.containsKey('intro')) {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(Routes.boardingRoute);
        }
        await sharedPreferences.setBool('intro', true);
      } else {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(Routes.authRoute);
        }
      }
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
