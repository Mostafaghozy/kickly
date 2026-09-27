import 'package:flutter/material.dart';
import 'package:kickly/features/profile/views/add_new_address_view.dart';
import 'package:kickly/shared/appbar_profile_items.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';

import '../widgets/address_field.dart';
import '../widgets/location_map_card.dart';
import '../widgets/add_address_button.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
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
      appBar: const AppBarProfileItems(txt: 'Location'),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address
              AddressField(controller: addressController),

              const SizedBox(height: 12),

              // Map
              LocationMapCard(
                onLocationTap: () {
                  _getCurrentLocation();
                },
              ),

              const Spacer(),

              // Add New Address
              AddAddressButton(
                onPressed: () {
                  _addNewAddress();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewAddressView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getCurrentLocation() {
    debugPrint('Get current location');
  }

  void _addNewAddress() {
    debugPrint('Address: ${addressController.text}');
  }
}
