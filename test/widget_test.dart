import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kickly/core/themes/app_theme.dart';
import 'package:kickly/main.dart';

void main() {
  testWidgets('dark mode toggle updates app theme', (
    WidgetTester tester,
  ) async {
    AppTheme.setDarkMode(false);

    await tester.pumpWidget(const MyApp());

    var materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.themeMode, ThemeMode.light);

    AppTheme.setDarkMode(true);
    await tester.pump();

    materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.themeMode, ThemeMode.dark);
  });
}
