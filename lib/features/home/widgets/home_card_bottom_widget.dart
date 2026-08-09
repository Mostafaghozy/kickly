import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class HomeCardBottomWidget extends StatelessWidget {
  const HomeCardBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 210),

      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 37, 39, 40),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: 'Nasr city field', color: Colors.white),
              const Gap(8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 12),
                  const Gap(4),
                  CustomText(
                    text: 'Nasr city, Cairo',
                    size: 12,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'E£700/hr',
                size: 17,
                color: Colors.white,
                weight: FontWeight.w800,
              ),
              const Gap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xff9DFEC8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomText(
                  text: 'Available',
                  size: 10,
                  color: Color(0xff008A3D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
