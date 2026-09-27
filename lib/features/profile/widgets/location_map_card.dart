import 'package:flutter/material.dart';
import 'package:kickly/features/details/widgets/location_widget.dart';

class LocationMapCard extends StatelessWidget {
  const LocationMapCard({super.key, this.onLocationTap});

  final VoidCallback? onLocationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FakeMapWidget(),
    );
  }
}
