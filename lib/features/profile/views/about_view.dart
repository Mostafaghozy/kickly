import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfileItems(txt: 'About app'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/auth/logo.light.png',
                height: 100,
                width: 270,
              ),
            ),
            Gap(30),
            CustomText(text: "Kickly app"),
            Gap(10),
            CustomText(
              text:
                  "Kickly is a smart sports venue booking platform designed to make finding and reserving sports venues faster and easier than ever. Whether you're planning a football match with friends, booking a padel court after work, or exploring new places to play, Kickly brings everything together in one seamless experience. Browse nearby venues, compare prices, check real-time availability, make secure payments, and receive instant booking confirmations—all from a single app. Our mission is to help players spend less time searching and more time enjoying the game, while giving venue owners a simple and efficient way to manage bookings.",
            ),
          ],
        ),
      ),
    );
  }
}
