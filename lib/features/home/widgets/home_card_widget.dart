import 'package:flutter/material.dart';
import 'package:kickly/features/home/widgets/home_card_item_widget.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return HomeCardItem(
              title: 'Nasr city field',
              location: 'Nasr city, Cairo',
              price: 'E£700/hr',
              rate: '4.7',
            );
          },
        ),
      ),
    );
  }
}
