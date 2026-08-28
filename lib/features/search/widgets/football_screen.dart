import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/home/widgets/home_card_bottom_widget.dart';
import 'package:kickly/features/search/widgets/search_widget.dart';
import 'package:kickly/features/search/widgets/small_container_field.dart';
import 'package:kickly/features/search/widgets/sport_chip.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';

class FootballScreen extends StatelessWidget {
  const FootballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              SearchWidget(),
              Gap(30),
              Row(
                children: [
                  SportChip(title: 'Football'),
                  Gap(10),
                  SportChip(title: 'Cairo'),
                ],
              ),
              Gap(20),
              SmallContainerField(),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
