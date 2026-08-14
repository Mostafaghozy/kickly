import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/search/widgets/search_widget.dart';
import 'package:kickly/shared/banner_widget.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
