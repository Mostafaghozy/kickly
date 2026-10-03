import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/search/widgets/search_widget.dart';
import 'package:kickly/features/search/widgets/small_container_field.dart';
import 'package:kickly/features/search/widgets/sport_chip.dart';
import 'package:kickly/shared/custom_text.dart';

class FootballScreen extends StatelessWidget {
  const FootballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const Gap(30),

        // Search
        const SearchWidget(),

        const Gap(30),

        // Filters
        const Row(
          children: [
            SportChip(title: 'Football'),

            Gap(10),

            SportChip(title: 'Cairo'),
          ],
        ),

        const Gap(20),

        const SmallContainerField(),

        const Gap(100),
      ],
    );
  }
}
