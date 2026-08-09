import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Image.asset("assets/home/kickly.png", width: 300),
      ),
      backgroundColor: AppColors.primary,
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
