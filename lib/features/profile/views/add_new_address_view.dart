import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/payment/widgets/billing_txt_field.dart';
import 'package:kickly/features/payment/widgets/field_label.dart';
import 'package:kickly/features/payment/widgets/postal_formatter.dart';
import 'package:kickly/features/profile/widgets/add_address_button.dart';
import 'package:kickly/features/profile/widgets/address_field.dart';
import 'package:kickly/features/profile/widgets/location_map_card.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_text.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final addressController = TextEditingController(
    text: 'Cairo, Nasr City, Abbas elakkad st, 12526',
  );

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfileItems(txt: 'Add new address'),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Address", size: 16),
              Gap(12),
              // Address
              AddressField(controller: addressController),

              const SizedBox(height: 12),

              // Map
              LocationMapCard(
                onLocationTap: () {
                  _getCurrentLocation();
                },
              ),
              const Gap(14),
              FieldLabel("City"),

              Gap(6),

              BillingTxtField(hintText: "Enter your city"),
              const Gap(14),
              FieldLabel("District"),

              Gap(6),

              BillingTxtField(hintText: "enter your district"),
              const Gap(14),
              FieldLabel("Street"),

              Gap(6),

              BillingTxtField(hintText: "Enter your street"),

              const Gap(14),

              // Postal Code
              FieldLabel("Building Number"),

              Gap(6),

              BillingTxtField(
                inputFormatters: [PostalFormatter()],
                hintText:
                    "ex: 12345                                                        optional",
                keyboardType: TextInputType.number,
              ),
              Gap(20),
              AddAddressButton(onPressed: () {}),
              Gap(50),

              // Add New Address
            ],
          ),
        ),
      ),
    );
  }
}

void _getCurrentLocation() {
  debugPrint('Get current location');
}
