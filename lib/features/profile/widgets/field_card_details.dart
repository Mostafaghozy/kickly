import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/profile/widgets/card_input_field.dart';
import 'package:kickly/features/profile/widgets/card_number_formatter.dart';
import 'package:kickly/features/profile/widgets/card_expiration_formatter.dart';
import 'package:kickly/features/profile/widgets/cvc_formatter.dart';
import 'package:kickly/features/profile/widgets/field_label.dart';

class FieldCardDetails extends StatelessWidget {
  const FieldCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Number
          const FieldLabel("Card Number"),
          Gap(6),
          CardInputField(
            hintText: "1234 5678 9101 3456",
            prefixIcon: Icons.credit_card_outlined,
            inputFormatters: [CardNumberFormatter()],
            keyboardType: TextInputType.number,
          ),

          Gap(12),

          // First Name + Last Name
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel("First Name"),
                    Gap(6),
                    CardInputField(
                      hintText: "First Name",
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),

              Gap(10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel("Last Name"),
                    Gap(6),
                    CardInputField(
                      hintText: "Last Name",
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Gap(10),

          // Expiration + CVC
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel("Card Expiration"),
                    Gap(6),
                    CardInputField(
                      hintText: "MM/YY",
                      keyboardType: TextInputType.number,
                      inputFormatters: [CardExpirationFormatter()],
                    ),
                  ],
                ),
              ),

              Gap(10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel("CVC"),
                    Gap(6),
                    CardInputField(
                      hintText: "3 Digits",
                      keyboardType: TextInputType.number,
                      inputFormatters: [CVCFormatter()],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
