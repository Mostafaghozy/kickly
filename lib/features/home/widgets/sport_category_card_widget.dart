import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';

class SportCategoryCardWidget extends StatelessWidget {
  const SportCategoryCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  final String title;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: ImageBackground(image: image),
          ),

          Positioned(
            bottom: 7,
            left: 30,
            child: CustomText(text: title, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
