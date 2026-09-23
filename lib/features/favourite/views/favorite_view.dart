import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/search/widgets/small_container_field.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';
import 'package:kickly/shared/custom_text.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Favorite Venues", size: 20),
                  CustomText(text: "8 Results", weight: FontWeight.w400),
                ],
              ),
              Gap(30),
              SmallContainerField(),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
