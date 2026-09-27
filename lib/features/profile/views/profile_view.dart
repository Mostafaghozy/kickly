import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/core/themes/app_theme.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/payment/view/payment_method_view.dart';
import 'package:kickly/features/profile/views/about_view.dart';
import 'package:kickly/features/profile/views/location_view.dart';
import 'package:kickly/features/profile/views/personal_details_view.dart';
import 'package:kickly/features/profile/widgets/logout_button.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';
import 'package:kickly/shared/custom_text.dart';

import '../widgets/profile_header_card.dart';
import '../widgets/account_section_title.dart';
import '../widgets/account_option_tile.dart';
import '../widgets/preference_option_tile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkMode = AppTheme.darkMode.value;

  @override
  void initState() {
    super.initState();
    isDarkMode = AppTheme.darkMode.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Card
              const ProfileHeaderCard(
                name: "Mostafa Ghozy",
                email: 'MostafaGhozyy99@gmail.com',
                image: 'assets/profile/profile.jpg',
              ),

              Gap(30),

              // My Account
              const AccountSectionTitle(title: 'My Account'),

              Gap(16),

              // Personal Details
              AccountOptionTile(
                widget: const Icon(Icons.account_circle_outlined),
                title: 'Personal Details',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalDetailsView(),
                    ),
                  );
                },
              ),

              Gap(16),

              // Security
              AccountOptionTile(
                widget: const Icon(Icons.lock_outline_rounded),
                title: 'Security',
                onTap: () {
                  // TODO: Navigate to security
                },
              ),

              Gap(30),

              // Preferences
              const AccountSectionTitle(title: 'Preferences'),

              Gap(16),

              // Dark Mode
              PreferenceOptionTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark mode',
                trailing: PreferenceTrailing.switchButton,
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                  AppTheme.setDarkMode(value);
                },
              ),

              Gap(16),

              // Language
              PreferenceOptionTile(
                icon: Icons.language_outlined,
                title: 'Language',
                trailing: PreferenceTrailing.dropdown,
                onTap: () {
                  // TODO: Language
                },
              ),

              Gap(16),

              // Notifications
              PreferenceOptionTile(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                trailing: PreferenceTrailing.dropdown,
                onTap: () {
                  // TODO: Notifications
                },
              ),

              Gap(16),

              // Location
              PreferenceOptionTile(
                icon: Icons.location_on_outlined,
                title: 'Location',
                trailing: PreferenceTrailing.arrow,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationView(),
                    ),
                  );
                },
              ),
              Gap(30),
              const AccountSectionTitle(title: 'My Activity'),
              Gap(16),
              AccountOptionTile(
                widget: const Icon(Icons.payments_outlined),
                title: 'My Bookings',
                onTap: () {
                  // TODO: Navigate to personal details
                },
              ),

              Gap(16),

              // Security
              AccountOptionTile(
                widget: const Icon(Icons.star_border),
                title: 'Reviews & Ratings',
                onTap: () {
                  // TODO: Navigate to security
                },
              ),

              //Payment Method
              Gap(30),
              const AccountSectionTitle(title: 'Payment'),
              Gap(16),
              AccountOptionTile(
                widget: const Icon(Icons.library_books_outlined),
                title: 'Invoices',
                onTap: () {
                  // TODO: Navigate to personal details
                },
              ),

              Gap(16),

              // Security
              AccountOptionTile(
                widget: const Icon(Icons.payment),
                title: 'Payment methods',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentMethodView(),
                    ),
                  );
                },
              ),
              Gap(30),
              const AccountSectionTitle(title: 'About'),
              Gap(16),
              AccountOptionTile(
                widget: const Icon(Icons.info_outline),
                title: 'About App',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutView()),
                  );
                },
              ),

              Gap(16),

              // Security
              AccountOptionTile(
                widget: const Icon(Icons.privacy_tip_outlined),
                title: 'Privacy & Policies',
                onTap: () {},
              ),
              Gap(16),
              AccountOptionTile(
                widget: const Icon(Icons.question_mark),
                title: 'FAQ',
                onTap: () {},
              ),
              Gap(30),
              const AccountSectionTitle(title: 'Linked Accounts'),
              Gap(16),
              AccountOptionTile(
                widget: Image.asset("assets/auth/google.png"),
                title: 'Google',
                onTap: () {
                  // TODO: Navigate to personal details
                },
                lastWidget: const CustomText(
                  text: 'Connected ✓',
                  color: AppColors.primary,
                ),
              ),

              Gap(16),

              // Security
              AccountOptionTile(
                widget: const Icon(Icons.apple),
                title: 'Apple',
                onTap: () {},
                lastWidget: const CustomText(
                  text: 'Not Connected',
                  color: Colors.red,
                ),
              ),

              Gap(50),
              LogoutButton(
                txt: "logout",
                onPressed: () {},
                color: Colors.white,
                backgroundColor: Colors.red,
                icon: Icons.logout,
              ),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
