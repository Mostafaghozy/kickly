import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/core/constants/app_strings.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Image.asset("assets/appbar/logo.png", width: 100),
      centerTitle: false,
      titleSpacing: 12,
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.notifications_none_sharp),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
