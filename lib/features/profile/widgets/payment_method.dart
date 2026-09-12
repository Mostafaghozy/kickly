import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/profile/widgets/card_details.dart';
import 'package:kickly/features/profile/widgets/payment_method_container.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_text.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfileItems(txt: 'Payment'),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Gap(30),
            CustomText(text: "Choose Payment Method", size: 20),
            Gap(25),
            PaymentMethodContainer(
              txt: 'Credit Card',
              icon: const Icon(Icons.credit_card, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardDetails()),
                );
              },
            ),
            Gap(20),
            PaymentMethodContainer(
              txt: 'Apple Pay',
              icon: const Icon(Icons.apple, color: Colors.black),
              onTap: () {},
            ),
            Gap(20),
            PaymentMethodContainer(
              txt: 'Vodafone Cash',
              icon: Image.asset(
                'assets/profile/vodafone_icon.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              onTap: () {},
            ),
            Gap(50),
            CustomText(text: "Subscription terms", size: 20),
            Gap(10),
            CustomText(
              text:
                  "Subscription will automatically renew unless canceled 24 hours before the end of the current period. You can manage and \ncancel your subscription from the app settings.\nThe amount will be debited from your card upon confirmation \nof purchase.",
              weight: FontWeight.w500,
              size: 11,
            ),
          ],
        ),
      ),
    );
  }
}
