import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kickly/core/themes/app_theme.dart';
import 'package:kickly/features/auth/views/sign_in_view.dart';
import 'package:kickly/features/auth/views/sign_in_view_2.dart';
import 'package:kickly/root.dart';
import 'package:kickly/features/auth/views/login_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const LoginView(),
    );
  }
}
