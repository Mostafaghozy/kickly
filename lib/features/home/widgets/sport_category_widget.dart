import 'package:flutter/material.dart';
import 'package:kickly/features/home/widgets/sport_category_card_widget.dart';

class SportCategoryWidget extends StatelessWidget {
  const SportCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const sports = <SportCategory>[
      SportCategory(
        title: 'Football',
        color: Color(0xFF1F2833),
        image: 'assets/home/football.png',
      ),
      SportCategory(
        title: 'Padel',
        color: Color(0xFF13261B),
        image: 'assets/home/padel.jpg',
      ),
      SportCategory(
        title: 'Basketball',
        color: Color(0xFF4A2210),
        image: 'assets/home/basketball.png',
      ),
      SportCategory(
        title: 'Volleyball',
        color: Color(0xFF172B44),
        image: 'assets/home/volleyball.jpg',
      ),
    ];

    return SizedBox(
      height: 172,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final sport = sports[index];
          return SportCategoryCardWidget(
            title: sport.title,
            image: sport.image,
            color: sport.color,
          );
        },
      ),
    );
  }
}

class SportCategory {
  const SportCategory({
    required this.title,
    required this.color,
    required this.image,
  });

  final String title;
  final Color color;
  final String image;
}
