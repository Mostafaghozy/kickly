import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/core/network/api_errors.dart';
import 'package:kickly/features/auth/data/auth_repo.dart';
import 'package:kickly/features/auth/views/login_view.dart';
import 'package:kickly/features/auth/widgets/custom_form_filed.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/shared/custom_text.dart';

class SignInView2 extends StatefulWidget {
  const SignInView2({super.key});

  @override
  State<SignInView2> createState() => _SignInView2State();
}

class _SignInView2State extends State<SignInView2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;

  Future<void> register() async {
    if (isLoading) return;

    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
    });

    try {
      final response = await authRepo.register(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response['message']?.toString() ?? 'Registration successful.',
            ),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      }
    } catch (e) {
      if (!mounted) return;

      final errorMessage = e is ApiErrors
          ? e.detail
          : 'Unable to create account. Please try again.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
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
                const Gap(20),
                const CustomText(
                  text: "First Name",
                  weight: FontWeight.w700,
                  size: 14,
                ),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Enter your first name',
                  controller: firstNameController,
                  isPassword: false,
                ),
                const Gap(10),
                const CustomText(
                  text: "Last Name",
                  weight: FontWeight.w700,
                  size: 14,
                ),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Enter your last name',
                  controller: lastNameController,
                  isPassword: false,
                ),
                const Gap(10),
                const CustomText(text: "Email", weight: FontWeight.w700, size: 14),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Enter your email',
                  controller: emailController,
                  isPassword: false,
                ),
                const Gap(10),
                const CustomText(
                  text: "Phone number",
                  weight: FontWeight.w700,
                  size: 14,
                ),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Enter your phone number',
                  controller: phoneController,
                  isPassword: false,
                ),
                const Gap(10),
                const CustomText(
                  text: "Password",
                  weight: FontWeight.w700,
                  size: 14,
                ),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Enter your password',
                  controller: passwordController,
                  isPassword: true,
                ),
                const Gap(10),
                const CustomText(
                  text: "Confirm Password",
                  weight: FontWeight.w700,
                  size: 14,
                ),
                const Gap(10),
                CustomFormFiled(
                  hintText: 'Confirm your password',
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                const Gap(30),
                CustomButton(
                  txt: isLoading ? 'Creating account...' : 'Sign up',
                  onPressed: isLoading ? () {} : register,
                  backgroundColor: AppColors.primary,
                  color: AppColors.darkText,
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(text: "You have account?"),
                      const Gap(5),
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
        ),
      ),
    );
  }
}
