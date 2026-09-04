import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/profile/widgets/billing_txt_field.dart';
import 'package:kickly/features/profile/widgets/drop_down_button_widget.dart';
import 'package:kickly/features/profile/widgets/field_label.dart';
import 'package:kickly/features/profile/widgets/postal_formatter.dart';
import 'package:kickly/shared/custom_text.dart';

class BillingAddressField extends StatelessWidget {
  const BillingAddressField({super.key, this.inputFormatters});
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Country
          FieldLabel("Country"),

          const Gap(8),

          DropDownButtonWidget(),

          const Gap(14),

          // Address
          FieldLabel("Address"),

          Gap(6),

          BillingTxtField(hintText: "Enter your full Address"),

          const Gap(14),

          // City
          FieldLabel("City"),

          Gap(6),

          BillingTxtField(hintText: "Enter your city"),

          const Gap(14),

          // Postal Code
          FieldLabel("Postal Code"),

          Gap(6),

          BillingTxtField(
            inputFormatters: [PostalFormatter()],
            hintText: "ex: 12345",
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
