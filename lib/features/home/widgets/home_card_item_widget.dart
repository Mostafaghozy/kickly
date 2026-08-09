import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/features/home/widgets/home_card_bottom_widget.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.rate,
  });

  final String title, location, price, rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700, width: .7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: const ImageBackground(image: "assets/home/stadium.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [Text("🌙"), Gap(5), Text("⚽")]),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        text: "⭐ $rate",
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: HomeCardBottomWidget(),
          ),
        ],
      ),
    );
  }
}
