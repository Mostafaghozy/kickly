import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/details/view/details_view.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';
import 'package:kickly/shared/banner_widget.dart';
import 'package:kickly/features/home/widgets/home_card_widget.dart';
import 'package:kickly/features/home/widgets/sport_category_widget.dart';
import 'package:kickly/shared/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              const BannerWidget(
                image: "assets/home/first.jpg",
                txt: "Find Your Next Game",
                desc:
                    "Discover nearby sports venues, compare prices, and book your \nfavorite field in just a few taps.",
              ),
              const Gap(25),
              const SportCategoryWidget(),
              Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Nearby for you", size: 20),
                  CustomText(
                    text: "View all",
                    color: isLight ? AppColors.lightLink : AppColors.darkText,
                  ),
                ],
              ),
              Gap(25),
              HomeCardWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsView(),
                    ),
                  );
                },
              ),
              Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Top Rated", size: 20),
                  CustomText(
                    text: "View all",
                    color: isLight ? AppColors.lightLink : AppColors.darkText,
                  ),
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
