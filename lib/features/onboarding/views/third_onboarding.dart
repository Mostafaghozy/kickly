import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/shared/image_background.dart';
import 'package:kickly/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:kickly/features/onboarding/widgets/text_onboarding.dart';
import 'package:kickly/root.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageBackground(image: "assets/onboarding/third.jpg"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 24, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextOnboarding(
                    txt: 'Find Your Perfect Venue',
                    description:
                        '   Manage all your bookings, explore new venues, and enjoy a smooth sports experience anytime with Kickly.',
                  ),

                  Gap(24),
                  CustomButton(
                    txt: 'Get Started',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Root()),
                      );
                    },
                  ),
                  Gap(24),
                  const OnboardingIndicator(currentIndex: 2, itemCount: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
