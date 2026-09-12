import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/auth/views/login_view.dart';
import 'package:kickly/features/auth/widgets/custom_form_filed.dart';
import 'package:kickly/features/auth/widgets/google_sign_in_button.dart';
import 'package:kickly/root.dart';
import 'package:kickly/shared/custom_button.dart';
import 'package:kickly/shared/custom_text.dart';

class SignInView2 extends StatelessWidget {
  const SignInView2({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(100),
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
            const Gap(25),
            const CustomText(text: "Email", weight: FontWeight.w700, size: 14),
            Gap(10),
            CustomFormFiled(hintText: 'Enter your email', isPassword: false),
            const Gap(15),
            const CustomText(
              text: "Phone number",
              weight: FontWeight.w700,
              size: 14,
            ),
            Gap(10),
            CustomFormFiled(
              hintText: 'Enter your phone number',
              isPassword: false,
            ),
            const Gap(15),
            const CustomText(
              text: "Full Name",
              weight: FontWeight.w700,
              size: 14,
            ),
            Gap(10),
            CustomFormFiled(hintText: 'Enter your Name', isPassword: false),
            const Gap(15),
            const CustomText(
              text: "Password",
              weight: FontWeight.w700,
              size: 14,
            ),
            Gap(10),
            CustomFormFiled(hintText: 'Enter your password', isPassword: false),
            const Gap(15),
            const CustomText(
              text: "Confirm Password",
              weight: FontWeight.w700,
              size: 14,
            ),
            Gap(10),
            CustomFormFiled(
              hintText: 'Confirm your password',
              isPassword: false,
            ),

            const Gap(50),
            CustomButton(
              label: "Sign up",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Root()),
                );
              },
            ),
            Gap(30),
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
