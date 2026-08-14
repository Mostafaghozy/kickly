import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';

import 'package:kickly/features/search/widgets/filter_section.dart';
import 'package:kickly/shared/custom_text.dart';

import 'package:kickly/shared/custom_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late List<GlobalKey<FilterSectionState>> filterKeys;

  @override
  void initState() {
    super.initState();
    filterKeys = [
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
      GlobalKey<FilterSectionState>(),
    ];
  }

  void _resetAllFilters() {
    for (var key in filterKeys) {
      final state = key.currentState as FilterSectionState?;
      state?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 750),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _resetAllFilters,
                  child: CustomText(
                    text: 'Reset',

                    color: AppColors.lightLink,
                    weight: FontWeight.w800,
                    size: 15,
                  ),
                ),
                const CustomText(
                  text: 'Filter',

                  size: 15,
                  weight: FontWeight.w700,
                  color: Colors.black,
                ),

                const SizedBox(width: 52),
              ],
            ),
            Gap(15),
            FilterSection(
              key: filterKeys[0],
              title: 'Filter by',
              isRadio: true,

              crossAxisCount: 2,
              options: [
                'Top Rated',
                'Newest',
                'Nearby for you',
                'Most popular',
              ],
            ),

            FilterSection(
              key: filterKeys[1],
              title: 'Category',
              crossAxisCount: 3,
              options: [
                'Football',
                'Basketball',
                'Volleyball',
                'Tennis',
                'Padel',
                'Handball',
              ],
            ),

            FilterSection(
              key: filterKeys[2],
              title: 'Playstyle',
              crossAxisCount: 4,
              options: ["3v3", "5v5", "8v8", "11v11"],
            ),

            FilterSection(
              key: filterKeys[3],
              title: 'Price',
              crossAxisCount: 3,
              options: [
                'Under 500',
                '500 - 1000',
                '1000 - 2500',
                '2500-5000',
                '5000-10000',
                'Over 10000',
              ],
            ),
            FilterSection(
              key: filterKeys[4],
              title: 'Distance',
              crossAxisCount: 3,
              options: [
                'Under 1 km',
                '1 - 5 km',
                '5 - 10 km',
                '10 - 50 km',
                '50 - 100 km',
                'Over 100 km',
              ],
            ),

            FilterSection(
              key: filterKeys[5],
              title: 'Availability',
              crossAxisCount: 2,
              options: [
                'Available Now',
                'Today',
                'Tomorrow',
                'After 2 to 7 days',
                'After Week',
              ],
            ),

            FilterSection(
              key: filterKeys[6],
              title: 'Venue type',
              isRadio: true,
              crossAxisCount: 2,
              options: ['Indoor', 'Outdoor'],
            ),

            CustomButton(
              onPressed: () => Navigator.pop(context),
              label: 'Search',
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
