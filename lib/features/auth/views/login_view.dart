import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/core/network/api_errors.dart';
import 'package:kickly/features/auth/data/auth_repo.dart';
import 'package:kickly/features/auth/views/sign_in_view.dart';
import 'package:kickly/features/auth/widgets/custom_form_filed.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/auth/widgets/google_sign_in_button.dart';
import 'package:kickly/root.dart';
import 'package:kickly/shared/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepo authRepo = AuthRepo();

  String? emailError;
  String? passwordError;
  bool isLoading = false;

  Future<void> login() async {
    if (isLoading) return;

    FocusScope.of(context).unfocus();

    setState(() {
      emailError = emailController.text.trim().isEmpty
          ? 'Email or phone number is required'
          : null;
      passwordError = passwordController.text.trim().isEmpty
          ? 'Password is required'
          : null;
    });

    if (emailError != null || passwordError != null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final user = await authRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (!mounted) return;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Root()),
        );
      }
    } catch (e) {
      if (!mounted) return;

      final errorMessage = e is ApiErrors
          ? e.detail
          : 'Unable to login. Please try again.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade700,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(60),

                Center(
                  child: Image.asset(
                    isLight
                        ? 'assets/auth/logo.light.png'
                        : 'assets/appbar/logo.png',
                    width: 279,
                    height: 90,
                  ),
                ),

                const Gap(24),

                const CustomText(
                  text: 'Email or phone number',
                  weight: FontWeight.w700,
                  size: 14,
                ),

                const Gap(8),

                CustomFormFiled(
                  hintText: 'Enter your email or phone number',
                  isPassword: false,
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      emailError = value.trim().isEmpty
                          ? 'Email or phone number is required'
                          : null;
                    });
                  },
                ),

                if (emailError != null) ...[
                  const Gap(4),
                  CustomText(text: emailError!, color: Colors.red, size: 12),
                ],

                const Gap(16),

                const CustomText(
                  text: 'Password',
                  weight: FontWeight.w700,
                  size: 14,
                ),

                const Gap(8),

                CustomFormFiled(
                  hintText: 'Enter your password',
                  isPassword: true,
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() {
                      passwordError = value.trim().isEmpty
                          ? 'Password is required'
                          : null;
                    });
                  },
                ),

                if (passwordError != null) ...[
                  const Gap(4),
                  CustomText(text: passwordError!, color: Colors.red, size: 12),
                ],

                const Gap(16),

                GestureDetector(
                  onTap: () {
                    // Navigate to forgot password screen.
                  },
                  child: const Text(
                    'Forget your password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ),

                const Gap(24),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    txt: isLoading ? 'Signing in...' : 'Sign in',
                    onPressed: isLoading ? () {} : login,
                    backgroundColor: AppColors.primary,
                    color: AppColors.darkText,
                  ),
                ),

                const Gap(30),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: isLight ? Colors.black : Colors.white,
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

                const Gap(30),

                GoogleSignInButton(
                  onPressed: () {},
                  txt: 'Continue with Apple',
                  lightImage: 'assets/auth/apple.light.png',
                  darkImage: 'assets/auth/apple.png',
                ),

                const Gap(30),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: CustomText(text: "You don't have account?"),
                      ),
                      const Gap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInView(),
                            ),
                          );
                        },
                        child: const CustomText(
                          text: 'Create account',
                          color: AppColors.lightLink,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
