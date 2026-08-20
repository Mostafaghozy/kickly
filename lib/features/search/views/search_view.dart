import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/search/widgets/search_widget.dart';
import 'package:kickly/features/search/widgets/sport_chip.dart';
import 'package:kickly/shared/banner_widget.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';
import 'package:kickly/shared/custom_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              const SearchWidget(),
              Gap(30),
              const BannerWidget(
                image: "assets/home/first.jpg",
                txt: 'Start Your Search',
                desc:
                    'Find the right venue based on your favorite sport, preferred \nlocation, and available time slots.',
              ),
              Gap(30),
              CustomText(text: "Sports", size: 20),
              Gap(20),

              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: [
                  SportChip(icon: '⚽', title: 'Football', onTap: () {}),
                  SportChip(icon: '🏀', title: 'Basketball', onTap: () {}),
                  SportChip(icon: '🏓', title: 'Padel', onTap: () {}),
                  SportChip(icon: '🏐', title: 'Volleyball', onTap: () {}),
                  SportChip(icon: '🏉', title: 'Handball', onTap: () {}),
                  SportChip(icon: '🎾', title: 'Tennis', onTap: () {}),
                ],
              ),
              Gap(30),
              CustomText(text: "Playstyle", size: 20),
              Gap(20),
              Wrap(
                spacing: 20,
                children: [
                  SportChip(title: '3v3', onTap: () {}),
                  SportChip(title: '5v5', onTap: () {}),
                  SportChip(title: '8v8', onTap: () {}),
                  SportChip(title: '11v11', onTap: () {}),
                ],
              ),
              Gap(30),
              CustomText(text: "Popular Searches", size: 20),
              Gap(20),
              Wrap(
                spacing: 20,
                runSpacing: 10,

                children: [
                  SportChip(title: 'Football Fields', onTap: () {}),
                  SportChip(title: 'Padel Courts', onTap: () {}),
                  SportChip(title: 'Football Venues', onTap: () {}),
                  SportChip(title: 'Indoor Football', onTap: () {}),
                  SportChip(title: 'Basketball Courts', onTap: () {}),
                ],
              ),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
