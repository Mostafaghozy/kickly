import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/payment/widgets/field_label.dart';
import 'package:kickly/features/profile/widgets/profile_header_card.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';

import '../widgets/personal_details_header.dart';
import '../widgets/personal_details_field.dart';
import '../widgets/personal_details_phone_field.dart';

class PersonalDetailsView extends StatefulWidget {
  const PersonalDetailsView({super.key});

  @override
  State<PersonalDetailsView> createState() => _PersonalDetailsViewState();
}

class _PersonalDetailsViewState extends State<PersonalDetailsView> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfileItems(txt: 'Edit Personal Details'),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              const ProfileHeaderCard(
                name: "Mostafa Ghozy",
                email: 'MostafaGhozyy99@gmail.com',
                image: 'assets/profile/profile.jpg',
              ),

              Gap(30),
              FieldLabel("Email"),
              Gap(5),

              // Email
              PersonalDetailsField(
                hintText: 'Abdosfw66@gmail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              Gap(15),
              FieldLabel("Full Name"),
              Gap(5),

              // Full Name
              PersonalDetailsField(
                hintText: 'Enter your new full name',
                controller: fullNameController,
              ),

              Gap(15),
              FieldLabel("Phone Number"),
              Gap(5),

              // Phone
              PersonalDetailsPhoneField(
                controller: phoneController,
                onEdit: () {
                  // Edit phone number
                },
                hintText: 'Enter your phone number',
              ),

              const Spacer(),

              // Save
              CustomButton(
                backgroundColor: AppColors.primary,
                color: Colors.white,
                txt: 'Save',
                onPressed: () {
                  _saveDetails();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveDetails() {
    final fullName = fullNameController.text;
    final phone = phoneController.text;

    debugPrint('Full Name: $fullName');
    debugPrint('Phone: $phone');

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Personal details saved')));
  }
}
