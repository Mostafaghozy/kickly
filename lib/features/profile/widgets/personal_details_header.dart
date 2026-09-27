import 'package:flutter/material.dart';

class PersonalDetailsHeader extends StatelessWidget {
  const PersonalDetailsHeader({
    super.key,
    required this.name,
    required this.email,
    required this.image,
    this.onEdit,
  });

  final String name;
  final String email;
  final String image;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),

              Positioned(
                right: -2,
                top: -2,
                child: GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A651),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 8, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                email,
                style: const TextStyle(fontSize: 8, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
