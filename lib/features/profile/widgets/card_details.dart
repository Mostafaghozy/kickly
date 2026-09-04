import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/profile/widgets/billing_address_field.dart';
import 'package:kickly/features/profile/widgets/field_card_details.dart';
import 'package:kickly/features/profile/widgets/payment_method.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_text.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: const AppBarProfileItems(txt: "Card Payment"),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText(text: "Card Details", size: 20),
            ),
            const Gap(20),
            const FieldCardDetails(),
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomText(text: "Billing Address", size: 20),
            ),
            const Gap(20),
            const BillingAddressField(),
            const Gap(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomButton(
                txt: "Save Card",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentMethod(),
                    ),
                  );
                },
                backgroundColor: AppColors.primary,
                color: AppColors.lightCard,
              ),
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
