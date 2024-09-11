import 'package:firebase_core/firebase_core.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(
    apiKey: StringsManager.geminiApiKey,
  );
  runApp(
    MyApp(),
  );
}
