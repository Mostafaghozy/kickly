import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class AccountSectionTitle extends StatelessWidget {
  const AccountSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomText(text: title, size: 20);
  }
}
