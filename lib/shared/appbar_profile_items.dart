import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class AppBarProfileItems extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarProfileItems({super.key, required this.txt});
  final String txt;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.replay),
      ),
      centerTitle: true,
      title: CustomText(
        text: txt,
        size: 16,
        weight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }
}
