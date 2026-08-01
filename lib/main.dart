import 'package:flutter/material.dart';
import 'package:kickly/features/home/views/home_view.dart';
import 'package:kickly/features/onboarding/views/onboarding_view.dart';
import 'package:kickly/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashView(),
    );
  }
}
