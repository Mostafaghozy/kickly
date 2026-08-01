import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/onboarding/views/second_onboarding_view.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/onboarding/widgets/onboarding_background.dart';
import 'package:kickly/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:kickly/features/onboarding/widgets/text_onboarding.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardingBackground(image: "assets/onboarding/first.jpg"),
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
                        'Discover football fields, padel courts, and\ntop-rated sports venues nearby with real-time\navailability and effortless booking.',
                  ),

                  Gap(24),
                  CustomButton(
                    txt: 'Next',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const SecondOnboardingView(),
                        ),
                      );
                    },
                  ),
                  Gap(24),
                  const OnboardingIndicator(currentIndex: 0, itemCount: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
