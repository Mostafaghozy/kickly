import 'package:flutter/material.dart';

class CustomImageAppBar extends StatelessWidget {
  const CustomImageAppBar({
    super.key,
    required this.image,
    this.onBack,
    this.onFavorite,
    this.onShare,
  });

  final String image;
  final VoidCallback? onBack;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,

      child: Stack(
        children: [
          // Background image
          Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

          // Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.30)),
          ),

          // Back button
          Positioned(
            top: 38,
            left: 20,
            child: _AppBarIcon(icon: Icons.replay, onTap: onBack),
          ),

          // Favorite button
          Positioned(
            top: 38,
            right: 50,
            child: _AppBarIcon(icon: Icons.favorite_border, onTap: onFavorite),
          ),

          // Share button
          Positioned(
            top: 38,
            right: 20,
            child: _AppBarIcon(icon: Icons.shortcut_rounded, onTap: onShare),
          ),
        ],
      ),
    );
  }
}

class _AppBarIcon extends StatelessWidget {
  const _AppBarIcon({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
