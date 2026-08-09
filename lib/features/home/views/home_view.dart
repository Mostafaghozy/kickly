import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/home/widgets/home_app_bar_widget.dart';
import 'package:kickly/features/home/widgets/home_banner_widget.dart';
import 'package:kickly/features/home/widgets/home_card_widget.dart';
import 'package:kickly/features/home/widgets/sport_category_widget.dart';
import 'package:kickly/shared/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              const HomeBannerWidget(),
              const Gap(25),
              const SportCategoryWidget(),
              Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Nearby for you", size: 20),
                  CustomText(text: "View all"),
                ],
              ),
              Gap(25),
              const HomeCardWidget(),
              Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Top Rated", size: 20),
                  CustomText(text: "View all"),
                ],
              ),
              Gap(25),
              const HomeCardWidget(),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
