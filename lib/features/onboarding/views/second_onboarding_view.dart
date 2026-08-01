import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/onboarding/views/third_onboarding.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/onboarding/widgets/onboarding_background.dart';
import 'package:kickly/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:kickly/features/onboarding/widgets/text_onboarding.dart';

class SecondOnboardingView extends StatelessWidget {
  const SecondOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardingBackground(image: "assets/onboarding/second.jpg"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 24, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextOnboarding(
                    txt: 'Book in Just a Few Taps',
                    description:
                        'Compare venues, choose your preferred time, complete secure payments, and receive instant booking confirmation without any hassle.',
                  ),
                  Gap(24),

                  CustomButton(
                    txt: 'Next',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const ThirdOnboarding(),
                        ),
                      );
                    },
                  ),
                  Gap(24),
                  const OnboardingIndicator(currentIndex: 1, itemCount: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
