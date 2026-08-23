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
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(150),
            Center(
              child: isLight
                  ? Image.asset(
                      "assets/auth/logo.light.png",
                      width: 279,
                      height: 90,
                    )
                  : Image.asset(
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
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: isLight ? Colors.black : Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomText(
                    text: 'or',

                    color: isLight ? Colors.black : Colors.white,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: isLight ? Colors.black : Colors.white,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const Gap(30),
            GoogleSignInButton(
              onPressed: () {},

              txt: 'Continue with Google',
              lightImage: 'assets/auth/google.png',
              darkImage: 'assets/auth/google.png',
            ),
            Gap(30),
            GoogleSignInButton(
              onPressed: () {},

              txt: 'Continue with Apple',
              lightImage: 'assets/auth/apple.light.png',
              darkImage: 'assets/auth/apple.png',
            ),
            Gap(50),
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
