import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/auth/views/login_view.dart';
import 'package:kickly/features/auth/views/sign_in_view_2.dart';
import 'package:kickly/features/auth/widgets/custom_form_filed.dart';
import 'package:kickly/features/auth/widgets/google_sign_in_button.dart';
import 'package:kickly/shared/custom_button.dart';
import 'package:kickly/shared/custom_text.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(150),
            Center(
              child: Image.asset(
                "assets/appbar/logo.png",
                width: 279,
                height: 90,
              ),
            ),
            const Gap(24),
            const CustomText(text: "Email", weight: FontWeight.w700, size: 14),
            Gap(10),
            CustomFormFiled(hintText: 'Enter your email', isPassword: false),

            const Gap(24),
            CustomButton(
              label: "Continue",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInView2()),
                );
              },
            ),
            const Gap(30),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.white, thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: CustomText(
                    text: 'or',

                    color: Colors.white,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                Expanded(child: Divider(color: Colors.white, thickness: 1)),
              ],
            ),
            const Gap(30),
            GoogleSignInButton(
              onPressed: () {},
              image: 'assets/auth/google.png',
              txt: 'Continue with Google',
            ),
            const Gap(30),
            GoogleSignInButton(
              onPressed: () {},
              image: 'assets/auth/apple.png',
              txt: 'Continue with Apple',
            ),
            Gap(150),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "You have account?"),
                  Gap(5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: const CustomText(
                      text: "Signin",
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
