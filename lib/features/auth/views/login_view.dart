import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/auth/widgets/custom_form_filed.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/auth/widgets/google_sign_in_button.dart';
import 'package:kickly/shared/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(100),
            Center(
              child: Image.asset(
                "assets/appbar/logo.png",
                width: 279,
                height: 90,
              ),
            ),
            Gap(24),
            CustomText(
              text: "Email or phone number",
              weight: FontWeight.w700,
              size: 14,
            ),
            Gap(8),
            CustomFormFiled(
              hintText: 'Enter your email or phone number',
              isPassword: false,
            ),
            Gap(16),
            CustomText(text: "Password", weight: FontWeight.w700, size: 14),
            Gap(8),
            CustomFormFiled(hintText: 'Enter your password', isPassword: false),
            Gap(16),
            Text(
              "Forget your password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "Mulish",
              ),
            ),
            Gap(24),
            CustomButton(
              txt: "Sign in",
              onPressed: () {},
              backgroundColor: AppColors.primary,
              color: AppColors.darkText,
            ),
            Gap(30),
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.white, thickness: 1),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: CustomText(
                    text: 'or',

                    color: Colors.white,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                const Expanded(
                  child: Divider(color: Colors.white, thickness: 1),
                ),
              ],
            ),
            Gap(30),
            GoogleSignInButton(
              onPressed: () {},
              image: 'assets/auth/google.png',
              txt: 'Continue with Google',
            ),
            Gap(30),
            GoogleSignInButton(
              onPressed: () {},
              image: 'assets/auth/apple.png',
              txt: 'Continue with Apple',
            ),
            Gap(80),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "You don't have account?"),
                  Gap(5),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign In
                    },
                    child: const CustomText(
                      text: "Create account",
                      color: AppColors.lightLink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
