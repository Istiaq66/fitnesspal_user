import 'package:fitnesspal_user/presentation/auth/providers/auth_provider.dart';
import 'package:fitnesspal_user/presentation/consumption/providers/consumption_provider.dart';
import 'package:fitnesspal_user/presentation/home/providers/home_provider.dart';
import 'package:fitnesspal_user/presentation/profile/providers/profile_provider.dart';
import 'package:fitnesspal_user/presentation/settings/providers/settings_provider.dart';
import 'package:fitnesspal_user/presentation/workouts/providers/workout_provider.dart';
import 'package:fitnesspal_user/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;
  const MyApp._internal({required this.prefs});
  static MyApp instance({required SharedPreferences prefs}) => MyApp._internal(prefs: prefs);

  factory MyApp({required SharedPreferences prefs}) => instance(prefs: prefs);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SettingsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: WorkoutProvider(widget.prefs),
        ),
        ChangeNotifierProvider.value(
          value: ConsumptionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProfileProvider(),
        )
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        ),
        designSize: const Size(430, 810),
      ),
    );
  }
}
