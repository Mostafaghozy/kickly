import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kickly/features/home/views/home_view.dart';
import 'package:kickly/features/onboarding/views/first_onboarding_view.dart';
import 'package:kickly/features/onboarding/views/second_onboarding_view.dart';
import 'package:kickly/features/onboarding/views/third_onboarding.dart';
import 'package:kickly/root.dart';
import 'package:kickly/splash_view.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    //
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(),
      home: const Root(),
    );
  }
}
