import 'dart:math' as math;
import 'package:flutter/material.dart';

class FakeMapWidget extends StatelessWidget {
  const FakeMapWidget({super.key, this.onOpenLocation});

  final VoidCallback? onOpenLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          // Fake map
          const Positioned.fill(child: CustomPaint(painter: FakeMapPainter())),

          // Open Location button
          Positioned(
            left: 12,
            bottom: 14,
            child: GestureDetector(
              onTap: onOpenLocation,
              child: Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF4285F4), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Open Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FakeMapPainter extends CustomPainter {
  const FakeMapPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Background
    final backgroundPaint = Paint()..color = const Color(0xFFDCE7E5);

    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // Green areas
    _drawGreenAreas(canvas, size);

    // Small streets
    _drawSmallRoads(canvas, size);

    // Main roads
    _drawMainRoads(canvas, size);

    // River
    _drawRiver(canvas, size);
  }

  void _drawGreenAreas(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA9D6A5)
      ..style = PaintingStyle.fill;

    final areas = [
      Rect.fromLTWH(
        size.width * .02,
        size.height * .08,
        size.width * .22,
        size.height * .25,
      ),
      Rect.fromLTWH(
        size.width * .55,
        size.height * .03,
        size.width * .20,
        size.height * .18,
      ),
      Rect.fromLTWH(
        size.width * .72,
        size.height * .55,
        size.width * .25,
        size.height * .25,
      ),
      Rect.fromLTWH(
        size.width * .30,
        size.height * .65,
        size.width * .22,
        size.height * .30,
      ),
    ];

    for (final rect in areas) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(8)),
        paint,
      );
    }
  }

  void _drawSmallRoads(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFB7C8C6)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final random = math.Random(5);

    for (int i = 0; i < 35; i++) {
      final path = Path();

      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;

      path.moveTo(x, y);

      for (int j = 0; j < 3; j++) {
        x += random.nextDouble() * 80 - 40;
        y += random.nextDouble() * 60 - 30;

        path.lineTo(x, y);
      }

      canvas.drawPath(path, paint);
    }
  }

  void _drawMainRoads(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFD0B967)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Diagonal road
    final road1 = Path()
      ..moveTo(-20, size.height * .15)
      ..lineTo(size.width * .35, size.height * .45)
      ..lineTo(size.width * .75, size.height * .35)
      ..lineTo(size.width + 20, size.height * .55);

    canvas.drawPath(road1, roadPaint);

    // Another road
    final road2 = Path()
      ..moveTo(size.width * .25, -20)
      ..lineTo(size.width * .35, size.height * .35)
      ..lineTo(size.width * .20, size.height + 20);

    canvas.drawPath(road2, roadPaint);

    // Horizontal road
    final road3 = Path()
      ..moveTo(-20, size.height * .72)
      ..lineTo(size.width * .35, size.height * .68)
      ..lineTo(size.width + 20, size.height * .78);

    canvas.drawPath(road3, roadPaint);
  }

  void _drawRiver(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF43B5D3)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final river = Path()
      ..moveTo(size.width * .82, -20)
      ..cubicTo(
        size.width * .72,
        size.height * .20,
        size.width * .55,
        size.height * .25,
        size.width * .60,
        size.height * .48,
      )
      ..cubicTo(
        size.width * .65,
        size.height * .68,
        size.width * .45,
        size.height * .82,
        size.width * .38,
        size.height + 20,
      );

    canvas.drawPath(river, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
