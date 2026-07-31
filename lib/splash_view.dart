// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:kickly/core/constants/app_colors.dart';
// import 'package:kickly/root.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   late Animation<double> _logoFade;
//   late Animation<double> _logoScale;
//   late Animation<double> _imageFade;
//   late Animation<Offset> _imageSlide;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1800),
//     );

//     // Logo: fade in + scale up (0ms → 700ms)
//     _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
//       ),
//     );

//     _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.45, curve: Curves.elasticOut),
//       ),
//     );

//     // Image: fade in + slide up from bottom (500ms → 1800ms)
//     _imageFade = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.35, 0.75, curve: Curves.easeIn),
//       ),
//     );

//     _imageSlide = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
//         .animate(
//           CurvedAnimation(
//             parent: _controller,
//             curve: const Interval(0.35, 0.85, curve: Curves.easeOut),
//           ),
//         );

//     _controller.forward();

//     Future.delayed(const Duration(seconds: 3), () {
//       if (mounted) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Root()),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Gap(200),

//             // Animated logo
//             FadeTransition(
//               opacity: _logoFade,
//               child: ScaleTransition(
//                 scale: _logoScale,
//                 child: SvgPicture.asset("assets/logo/Hungry_.svg"),
//               ),
//             ),

//             const Spacer(),

//             // Animated splash image
//             FadeTransition(
//               opacity: _imageFade,
//               child: SlideTransition(
//                 position: _imageSlide,
//                 child: Image.asset("assets/splash/splash.png"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
